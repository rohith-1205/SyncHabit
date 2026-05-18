import 'dart:convert';
import 'package:isar/isar.dart';
import '../../../../../core/utils/logger.dart';
import '../../../../../database/database.dart'; // DatabaseService, HabitCollection, SyncStatus
import '../../../../../sync/queue/sync_queue.dart';
import '../../models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<List<HabitModel>> getHabits();
  Future<HabitModel> toggleHabit(HabitModel habit);
  Future<HabitModel> createHabit(HabitModel habit);
  Future<HabitModel> updateHabit(HabitModel habit);
  Future<void> deleteHabit(String id);
}

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final AppLogger _logger;
  final String _userId;

  HabitLocalDataSourceImpl(this._dbService, this._syncQueue, this._logger, this._userId);

  Isar get _isar => _dbService.isar;

  @override
  Future<List<HabitModel>> getHabits() async {
    _logger.info('Fetching habits for user $_userId from Isar local database...');
    final collections = await _isar.habitCollections.filter().userIdEqualTo(_userId).findAll();

    final defaultUserHabits = await _isar.habitCollections.filter().userIdEqualTo('default_user').findAll();
    if (defaultUserHabits.isNotEmpty) {
      _logger.info('Cleaning up legacy/hardcoded default_user habits...');
      await _isar.writeTxn(() async {
        for (final h in defaultUserHabits) {
          await _isar.habitCollections.filter().habitIdEqualTo(h.habitId).deleteAll();
        }
      });
      final remaining = await _isar.habitCollections.filter().userIdEqualTo(_userId).findAll();
      return remaining.map((col) => HabitModel(
        id: col.habitId,
        title: col.title,
        iconName: col.iconName,
        streakCount: col.streakCount,
        isCompletedToday: col.isCompletedToday,
        progress: col.progress,
        category: col.category,
      )).toList();
    }

    if (collections.isEmpty) {
      _logger.info('No habits found in Isar for user $_userId.');
      return [];
    }

    return collections.map((col) => HabitModel(
      id: col.habitId,
      title: col.title,
      iconName: col.iconName,
      streakCount: col.streakCount,
      isCompletedToday: col.isCompletedToday,
      progress: col.progress,
      category: col.category,
    )).toList();
  }

  @override
  Future<HabitModel> toggleHabit(HabitModel habit) async {
    _logger.info('Toggling habit completion in Isar: ${habit.id}');
    final col = await _isar.habitCollections.filter().habitIdEqualTo(habit.id).findFirst();
    if (col == null) {
      _logger.warning('Habit not found in Isar: ${habit.id}');
      return habit;
    }

    final updatedModel = habit.copyWith(
      isCompletedToday: !habit.isCompletedToday,
      streakCount: habit.isCompletedToday ? habit.streakCount - 1 : habit.streakCount + 1,
      progress: habit.isCompletedToday ? 0.0 : 1.0,
    );

    col.isCompletedToday = updatedModel.isCompletedToday;
    col.streakCount = updatedModel.streakCount;
    col.progress = updatedModel.progress;
    col.updatedAt = DateTime.now();
    col.syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.habitCollections.put(col);

      final now = DateTime.now();
      final completionId = '${habit.id}_${now.year}_${now.month}_${now.day}';

      if (updatedModel.isCompletedToday) {
        final completionCol = HabitCompletionCollection()
          ..completionId = completionId
          ..habitId = habit.id
          ..userId = _userId
          ..completedAt = now
          ..count = 1
          ..syncStatus = SyncStatus.pending
          ..createdAt = now
          ..updatedAt = now;
        await _isar.habitCompletionCollections.put(completionCol);
      } else {
        await _isar.habitCompletionCollections.filter().completionIdEqualTo(completionId).deleteAll();
      }
    });

    await _syncQueue.enqueue(
      collectionType: CollectionType.habit,
      mutationType: MutationType.update,
      entityId: updatedModel.id,
      payloadJson: jsonEncode(updatedModel.toJson()),
    );

    return updatedModel;
  }

  @override
  Future<HabitModel> createHabit(HabitModel habit) async {
    _logger.info('Creating new habit in Isar: ${habit.title}');
    final col = HabitCollection()
      ..habitId = habit.id
      ..userId = _userId
      ..title = habit.title
      ..description = ''
      ..frequency = 'daily'
      ..targetDays = [1, 2, 3, 4, 5, 6, 7]
      ..targetCount = 1
      ..category = habit.category
      ..colorHex = '#8A2BE2'
      ..iconName = habit.iconName
      ..streakCount = habit.streakCount
      ..isCompletedToday = habit.isCompletedToday
      ..progress = habit.progress
      ..syncStatus = SyncStatus.pending
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.habitCollections.put(col);
    });

    await _syncQueue.enqueue(
      collectionType: CollectionType.habit,
      mutationType: MutationType.create,
      entityId: habit.id,
      payloadJson: jsonEncode(habit.toJson()),
    );

    return habit;
  }

  @override
  Future<HabitModel> updateHabit(HabitModel habit) async {
    _logger.info('Updating habit in Isar: ${habit.id}');
    final col = await _isar.habitCollections.filter().habitIdEqualTo(habit.id).findFirst();
    if (col == null) {
      _logger.warning('Habit not found in Isar: ${habit.id}');
      return habit;
    }

    col.title = habit.title;
    col.category = habit.category;
    col.iconName = habit.iconName;
    col.updatedAt = DateTime.now();
    col.syncStatus = SyncStatus.pending;

    await _isar.writeTxn(() async {
      await _isar.habitCollections.put(col);
    });

    await _syncQueue.enqueue(
      collectionType: CollectionType.habit,
      mutationType: MutationType.update,
      entityId: habit.id,
      payloadJson: jsonEncode(habit.toJson()),
    );

    return habit;
  }

  @override
  Future<void> deleteHabit(String id) async {
    _logger.info('Deleting habit from Isar: $id');
    await _isar.writeTxn(() async {
      await _isar.habitCollections.filter().habitIdEqualTo(id).deleteAll();
    });

    await _syncQueue.enqueue(
      collectionType: CollectionType.habit,
      mutationType: MutationType.delete,
      entityId: id,
      payloadJson: jsonEncode({'id': id}),
    );
  }
}
