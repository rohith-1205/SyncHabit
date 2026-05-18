import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';

class TaskController extends StateNotifier<AsyncValue<List<TaskEntity>>> {
  final TaskRepository _repository;
  final bool Function() _getIsPro;
  final AppLogger _logger;

  TaskController(this._repository, this._getIsPro, this._logger) : super(const AsyncValue.loading()) {
    loadTasks();
  }

  Future<void> loadTasks() async {
    _logger.info('TaskController: Loading all tasks...');
    state = const AsyncValue.loading();
    await _repository.generateRecurringInstances();
    final result = await _repository.getTasks();
    result.fold(
      (failure) {
        _logger.error('Failed to load tasks: ${failure.message}');
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (tasks) {
        _logger.info('Successfully loaded ${tasks.length} tasks');
        state = AsyncValue.data(tasks);
        _repository.getTaskAnalyticsSummary();
      },
    );
  }

  Future<bool> addTask(TaskEntity task) async {
    _logger.info('TaskController: Adding task ${task.title}');
    if (!_getIsPro()) {
      final activeTasksCount = state.value?.where((t) => t.state != TaskState.completed && t.state != TaskState.archived).length ?? 0;
      if (activeTasksCount >= 5) {
        _logger.warning('TaskController: Premium limit reached. Active tasks: $activeTasksCount');
        return false; // Indicates premium upgrade modal should be shown
      }
    }

    final result = await _repository.createTask(task);
    result.fold(
      (failure) => _logger.error('Failed to add task: ${failure.message}'),
      (created) {
        if (state.value != null) {
          state = AsyncValue.data([...state.value!, created]);
          _repository.getTaskAnalyticsSummary();
        }
      },
    );
    return true;
  }

  Future<void> updateTask(TaskEntity task) async {
    _logger.info('TaskController: Updating task ${task.title}');
    final result = await _repository.updateTask(task);
    result.fold(
      (failure) => _logger.error('Failed to update task: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((t) => t.id == task.id ? updated : t).toList();
          state = AsyncValue.data(list);
          _repository.getTaskAnalyticsSummary();
        }
      },
    );
  }

  Future<void> deleteTask(String id) async {
    _logger.info('TaskController: Deleting task $id');
    final result = await _repository.deleteTask(id);
    result.fold(
      (failure) => _logger.error('Failed to delete task: ${failure.message}'),
      (_) {
        if (state.value != null) {
          state = AsyncValue.data(state.value!.where((t) => t.id != id).toList());
          _repository.getTaskAnalyticsSummary();
        }
      },
    );
  }

  Future<void> toggleTaskCompletion(String id) async {
    _logger.info('TaskController: Toggling task $id');
    final result = await _repository.toggleTaskCompletion(id);
    result.fold(
      (failure) => _logger.error('Failed to toggle task: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((t) => t.id == id ? updated : t).toList();
          state = AsyncValue.data(list);
          _repository.getTaskAnalyticsSummary();
        }
      },
    );
  }

  Future<void> toggleTaskArchive(String id) async {
    _logger.info('TaskController: Toggling archive for task $id');
    final result = await _repository.toggleTaskArchive(id);
    result.fold(
      (failure) => _logger.error('Failed to toggle task archive: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((t) => t.id == id ? updated : t).toList();
          state = AsyncValue.data(list);
          _repository.getTaskAnalyticsSummary();
        }
      },
    );
  }

  Future<void> updateTaskSubtasks(String taskId, List<SubtaskEntity> subtasks) async {
    _logger.info('TaskController: Updating subtasks for task $taskId');
    final result = await _repository.updateTaskSubtasks(taskId, subtasks);
    result.fold(
      (failure) => _logger.error('Failed to update task subtasks: ${failure.message}'),
      (updated) {
        if (state.value != null) {
          final list = state.value!.map((t) => t.id == taskId ? updated : t).toList();
          state = AsyncValue.data(list);
        }
      },
    );
  }

  Future<Map<String, dynamic>?> getAnalyticsSummary() async {
    final result = await _repository.getTaskAnalyticsSummary();
    return result.fold(
      (failure) => null,
      (summary) => summary,
    );
  }
}
