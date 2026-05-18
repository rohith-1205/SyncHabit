import 'dart:convert';
import 'package:isar/isar.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/logger.dart';
import '../../../../core/utils/result.dart';
import '../../../../database/database.dart';
import '../../../../sync/queue/sync_queue.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';
import '../models/project_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final DatabaseService _dbService;
  final SyncQueue _syncQueue;
  final AppLogger _logger;
  final String _userId;

  const ProjectRepositoryImpl(this._dbService, this._syncQueue, this._logger, this._userId);

  Isar get _isar => _dbService.isar;

  @override
  Future<Result<List<ProjectEntity>>> getProjects() async {
    _logger.info('Fetching all projects for user $_userId from Isar...');
    try {
      final collections = await _isar.projectCollections.filter().userIdEqualTo(_userId).findAll();

      final defaultUserProjects = await _isar.projectCollections.filter().userIdEqualTo('default_user').findAll();
      if (defaultUserProjects.isNotEmpty) {
        _logger.info('Cleaning up legacy/hardcoded default_user projects...');
        await _isar.writeTxn(() async {
          for (final p in defaultUserProjects) {
            await _isar.projectCollections.filter().projectIdEqualTo(p.projectId).deleteAll();
          }
        });
        final remaining = await _isar.projectCollections.filter().userIdEqualTo(_userId).findAll();
        final models = remaining.map((col) => ProjectModel.fromCollection(col)).toList();
        return Result.success(models);
      }

      if (collections.isEmpty) {
        _logger.info('No projects found in Isar for user $_userId.');
        return Result.success([]);
      }

      final models = collections.map((col) => ProjectModel.fromCollection(col)).toList();
      return Result.success(models);
    } catch (e) {
      _logger.error('Failed to get projects: $e');
      return Result.failure(DatabaseFailure('Failed to load projects: $e'));
    }
  }

  @override
  Future<Result<ProjectEntity>> createProject(ProjectEntity project) async {
    _logger.info('Creating project: ${project.title}');
    try {
      final model = ProjectModel.fromEntity(project);
      final col = model.toCollection();

      await _isar.writeTxn(() async {
        await _isar.projectCollections.put(col);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.project,
        mutationType: MutationType.create,
        entityId: project.id,
        payloadJson: jsonEncode(model.toJson()),
      );

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to create project: $e');
      return Result.failure(DatabaseFailure('Failed to create project: $e'));
    }
  }

  @override
  Future<Result<ProjectEntity>> updateProject(ProjectEntity project) async {
    _logger.info('Updating project: ${project.title}');
    try {
      final model = ProjectModel.fromEntity(project);
      final col = model.toCollection();

      await _isar.writeTxn(() async {
        await _isar.projectCollections.put(col);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.project,
        mutationType: MutationType.update,
        entityId: project.id,
        payloadJson: jsonEncode(model.toJson()),
      );

      return Result.success(model);
    } catch (e) {
      _logger.error('Failed to update project: $e');
      return Result.failure(DatabaseFailure('Failed to update project: $e'));
    }
  }

  @override
  Future<Result<void>> deleteProject(String id) async {
    _logger.info('Deleting project: $id');
    try {
      await _isar.writeTxn(() async {
        await _isar.projectCollections.filter().projectIdEqualTo(id).deleteAll();
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.project,
        mutationType: MutationType.delete,
        entityId: id,
        payloadJson: jsonEncode({'id': id}),
      );

      return Result.success(null);
    } catch (e) {
      _logger.error('Failed to delete project: $e');
      return Result.failure(DatabaseFailure('Failed to delete project: $e'));
    }
  }

  @override
  Future<Result<ProjectEntity>> toggleArchiveProject(String id) async {
    _logger.info('Toggling archive project: $id');
    try {
      final col = await _isar.projectCollections.filter().projectIdEqualTo(id).findFirst();
      if (col == null) {
        return Result.failure(const DatabaseFailure('Project not found'));
      }

      final model = ProjectModel.fromCollection(col);
      final updatedModel = model.copyWith(
        isArchived: !model.isArchived,
        updatedAt: DateTime.now(),
      );

      final updatedCol = updatedModel.toCollection();
      await _isar.writeTxn(() async {
        await _isar.projectCollections.put(updatedCol);
      });

      await _syncQueue.enqueue(
        collectionType: CollectionType.project,
        mutationType: MutationType.update,
        entityId: id,
        payloadJson: jsonEncode(updatedModel.toJson()),
      );

      return Result.success(updatedModel);
    } catch (e) {
      _logger.error('Failed to toggle archive project: $e');
      return Result.failure(DatabaseFailure('Failed to toggle archive project: $e'));
    }
  }
}
