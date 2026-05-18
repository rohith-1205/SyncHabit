import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../models/task_model.dart';

class TaskRepositoryFirestoreImpl implements TaskRepository {
  final FirebaseFirestore _firestore;
  final AppLogger _logger;
  final String _userId;

  const TaskRepositoryFirestoreImpl(
    this._firestore,
    this._logger,
    this._userId,
  );

  @override
  Future<Result<List<TaskEntity>>> getTasks() async {
    _logger.info('Fetching all tasks for user $_userId from Firestore...');
    try {
      final snapshot = await _firestore
          .collection('tasks')
          .where('userId', isEqualTo: _userId)
          .get();

      final models = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return TaskModel.fromJson(data);
      }).toList();

      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks: $e');
      return Result.failure(DatabaseFailure('Failed to load tasks: $e'));
    }
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksForDate(DateTime date) async {
    _logger.info('Fetching tasks for date: $date for user $_userId');
    try {
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay
          .add(const Duration(days: 1))
          .subtract(Duration(microseconds: 1));

      final snapshot = await _firestore
          .collection('tasks')
          .where('userId', isEqualTo: _userId)
          .where('dueDate', isGreaterThanOrEqualTo: startOfDay)
          .where('dueDate', isLessThanOrEqualTo: endOfDay)
          .get();

      final models = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return TaskModel.fromJson(data);
      }).toList();

      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks for date: $e');
      return Result.failure(
          DatabaseFailure('Failed to load tasks for date: $e'));
    }
  }

  @override
  Future<Result<List<TaskEntity>>> getTasksForProject(String projectId) async {
    _logger.info('Fetching tasks for project: $projectId for user $_userId');
    try {
      final snapshot = await _firestore
          .collection('tasks')
          .where('userId', isEqualTo: _userId)
          .where('projectId', isEqualTo: projectId)
          .get();

      final models = snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return TaskModel.fromJson(data);
      }).toList();

      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get tasks for project: $e');
      return Result.failure(
          DatabaseFailure('Failed to load tasks for project: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> createTask(TaskEntity task) async {
    _logger.info('Creating task: ${task.title}');
    try {
      final model = TaskModel.fromEntity(task);
      final data = model.toJson();
      data['userId'] = _userId;
      data['createdAt'] = Timestamp.fromDate(task.createdAt);
      data['updatedAt'] = Timestamp.fromDate(task.updatedAt);
      if (task.dueDate != null) {
        data['dueDate'] = Timestamp.fromDate(task.dueDate!);
      }
      if (task.completedAt != null) {
        data['completedAt'] = Timestamp.fromDate(task.completedAt!);
      }

      await _firestore.collection('tasks').doc(task.id).set(data);
      _logger.info('Task created in Firestore: ${task.id}');

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to create task: $e');
      return Result.failure(DatabaseFailure('Failed to create task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> updateTask(TaskEntity task) async {
    _logger.info('Updating task: ${task.title}');
    try {
      final model = TaskModel.fromEntity(task);
      final data = model.toJson();
      data['userId'] = _userId;
      data['updatedAt'] = Timestamp.fromDate(task.updatedAt);
      if (task.dueDate != null) {
        data['dueDate'] = Timestamp.fromDate(task.dueDate!);
      } else {
        data['dueDate'] = null;
      }
      if (task.completedAt != null) {
        data['completedAt'] = Timestamp.fromDate(task.completedAt!);
      } else {
        data['completedAt'] = null;
      }

      await _firestore
          .collection('tasks')
          .doc(task.id)
          .update(data..removeWhere((k, v) => k == 'id'));
      _logger.info('Task updated in Firestore: ${task.id}');

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to update task: $e');
      return Result.failure(DatabaseFailure('Failed to update task: $e'));
    }
  }

  @override
  Future<Result<void>> deleteTask(String id) async {
    _logger.info('Deleting task: $id');
    try {
      await _firestore.collection('tasks').doc(id).delete();
      _logger.info('Task deleted from Firestore: $id');

      return Result.success(null);
    } catch (e) {
      _logger.error('Failed to delete task: $e');
      return Result.failure(DatabaseFailure('Failed to delete task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> toggleTaskCompletion(String id) async {
    _logger.info('Toggling task completion: $id');
    try {
      final doc = await _firestore.collection('tasks').doc(id).get();
      if (!doc.exists) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final data = doc.data()!;
      data['id'] = doc.id;
      final model = TaskModel.fromJson(data);

      final nextState = model.state == TaskState.completed
          ? TaskState.pending
          : TaskState.completed;
      final now = DateTime.now();

      final updatedModel = model.copyWith(
        state: nextState,
        completedAt: nextState == TaskState.completed ? now : null,
        updatedAt: now,
      );

      final updateData = {
        'state': nextState.name,
        'updatedAt': Timestamp.fromDate(now),
        'completedAt':
            nextState == TaskState.completed ? Timestamp.fromDate(now) : null,
      };

      await _firestore.collection('tasks').doc(id).update(updateData);
      _logger.info('Task completion toggled in Firestore: $id');

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to toggle task: $e');
      return Result.failure(DatabaseFailure('Failed to toggle task: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> toggleTaskArchive(String id) async {
    _logger.info('Toggling task archive: $id');
    try {
      final doc = await _firestore.collection('tasks').doc(id).get();
      if (!doc.exists) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final data = doc.data()!;
      data['id'] = doc.id;
      final model = TaskModel.fromJson(data);

      final nextState = model.state == TaskState.archived
          ? TaskState.pending
          : TaskState.archived;
      final now = DateTime.now();

      final updatedModel = model.copyWith(
        state: nextState,
        updatedAt: now,
      );

      await _firestore.collection('tasks').doc(id).update({
        'state': nextState.name,
        'updatedAt': Timestamp.fromDate(now),
      });
      _logger.info('Task archive toggled in Firestore: $id');

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to toggle task archive: $e');
      return Result.failure(
          DatabaseFailure('Failed to toggle task archive: $e'));
    }
  }

  @override
  Future<Result<TaskEntity>> updateTaskSubtasks(
      String taskId, List<SubtaskEntity> subtasks) async {
    _logger.info('Updating subtasks for task: $taskId');
    try {
      final doc = await _firestore.collection('tasks').doc(taskId).get();
      if (!doc.exists) {
        return Result.failure(const DatabaseFailure('Task not found'));
      }

      final data = doc.data()!;
      data['id'] = doc.id;
      final model = TaskModel.fromJson(data);

      final now = DateTime.now();
      final updatedModel = model.copyWith(
        subtasks: subtasks,
        updatedAt: now,
      );

      final subtasksJson =
          subtasks.map((st) => jsonEncode(st.toJson())).toList();

      await _firestore.collection('tasks').doc(taskId).update({
        'subtasks': subtasksJson,
        'updatedAt': Timestamp.fromDate(now),
      });

      _logger.info('Subtasks updated in Firestore: $taskId');
      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to update subtasks: $e');
      return Result.failure(DatabaseFailure('Failed to update subtasks: $e'));
    }
  }

  @override
  Future<Result<int>> getOverdueTaskCount() async {
    _logger.info('Getting overdue task count for user $_userId');
    try {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      final snapshot = await _firestore
          .collection('tasks')
          .where('userId', isEqualTo: _userId)
          .where('state', whereIn: ['pending', 'inProgress'])
          .where('dueDate', isLessThan: today)
          .get();

      return Result.success(snapshot.size);
    } catch (e) {
      _logger.error('Failed to get overdue task count: $e');
      return Result.failure(
          DatabaseFailure('Failed to get overdue task count: $e'));
    }
  }
}
