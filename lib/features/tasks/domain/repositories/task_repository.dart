import '../../../../core/utils/result.dart';
import '../entities/task_entity.dart';

abstract class TaskRepository {
  Future<Result<List<TaskEntity>>> getTasks();
  Future<Result<List<TaskEntity>>> getTasksForDate(DateTime date);
  Future<Result<List<TaskEntity>>> getTasksForProject(String projectId);
  Future<Result<TaskEntity>> createTask(TaskEntity task);
  Future<Result<TaskEntity>> updateTask(TaskEntity task);
  Future<Result<void>> deleteTask(String id);
  Future<Result<TaskEntity>> toggleTaskCompletion(String id);
  Future<Result<TaskEntity>> toggleTaskArchive(String id);
  Future<Result<TaskEntity>> updateTaskSubtasks(String taskId, List<SubtaskEntity> subtasks);
  Future<Result<void>> generateRecurringInstances();
  Future<Result<Map<String, dynamic>>> getTaskAnalyticsSummary();
}
