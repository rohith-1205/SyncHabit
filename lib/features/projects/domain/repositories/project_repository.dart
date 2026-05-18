import '../../../../core/utils/result.dart';
import '../entities/project_entity.dart';

abstract class ProjectRepository {
  Future<Result<List<ProjectEntity>>> getProjects();
  Future<Result<ProjectEntity>> createProject(ProjectEntity project);
  Future<Result<ProjectEntity>> updateProject(ProjectEntity project);
  Future<Result<void>> deleteProject(String id);
  Future<Result<ProjectEntity>> toggleArchiveProject(String id);
}
