import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/projects_repository_impl.dart';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

class UpdateProjectParams {
  Project project;
  UpdateProjectParams({
    required this.project,
  });
}

class UpdateProject extends UseCase<void, UpdateProjectParams> {
  ProjectsRepository repository;

  UpdateProject({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateProjectParams params) {
    return repository.updateProject(params.project);
  }
}

final updateProjectUseCaseProvider = Provider<UpdateProject>((ref) {
  final repository = ref.read(projectsRepositoryProvider);
  return UpdateProject(repository: repository);
});
