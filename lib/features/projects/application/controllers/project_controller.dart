import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/project_entity.dart';
import '../../domain/repositories/project_repository.dart';

class ProjectController extends StateNotifier<AsyncValue<List<ProjectEntity>>> {
  final ProjectRepository _repository;
  final AppLogger _logger;

  ProjectController(this._repository, this._logger) : super(const AsyncValue.loading()) {
    loadProjects();
  }

  Future<void> loadProjects() async {
    _logger.info('ProjectController: Loading all projects...');
    state = const AsyncValue.loading();
    final result = await _repository.getProjects();
    result.fold(
      (failure) {
        _logger.error('Failed to load projects: ${failure.message}');
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (projects) {
        _logger.info('Successfully loaded ${projects.length} projects');
        state = AsyncValue.data(projects);
      },
    );
  }

  Future<void> addProject(ProjectEntity project) async {
    _logger.info('ProjectController: Adding project ${project.title}');
    final result = await _repository.createProject(project);
    result.fold(
      (failure) => _logger.error('Failed to add project: ${failure.message}'),
      (created) {
        if (state.value != null) {
          state = AsyncValue.data([...state.value!, created]);
        }
      },
    );
  }

  Future<void> updateProject(ProjectEntity project) async {
    _logger.info('ProjectController: Updating project ${project.title}');
    final result = await _repository.updateProject(project);
    result.fold(
      (failure) => _logger.error('Failed to update project: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((p) => p.id == project.id ? updated : p).toList();
          state = AsyncValue.data(list);
        }
      },
    );
  }

  Future<void> deleteProject(String id) async {
    _logger.info('ProjectController: Deleting project $id');
    final result = await _repository.deleteProject(id);
    result.fold(
      (failure) => _logger.error('Failed to delete project: ${failure.message}'),
      (_) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.where((p) => p.id != id).toList());
        }
      },
    );
  }

  Future<void> toggleArchiveProject(String id) async {
    _logger.info('ProjectController: Toggling archive project $id');
    final result = await _repository.toggleArchiveProject(id);
    result.fold(
      (failure) => _logger.error('Failed to toggle archive project: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((p) => p.id == id ? updated : p).toList();
          state = AsyncValue.data(list);
        }
      },
    );
  }
}
