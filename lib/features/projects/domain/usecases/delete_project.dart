import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/projects_repository_impl.dart';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

class DeleteProjectParams {
  Project project;
  DeleteProjectParams({
    required this.project,
  });
}

class DeleteProject extends UseCase<void, DeleteProjectParams> {
  ProjectsRepository repository;

  DeleteProject({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(DeleteProjectParams params) {
    return repository.deleteProject(params.project);
  }
}

final deleteProjectUseCaseProvider = Provider<DeleteProject>((ref) {
  final repository = ref.read(projectsRepositoryProvider);
  return DeleteProject(repository: repository);
});
