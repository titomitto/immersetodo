import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/projects_repository_impl.dart';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

class GetProjects extends NoParamsUseCase<List<Project>> {
  ProjectsRepository repository;

  GetProjects({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Project>>> call() {
    return repository.getProjects();
  }
}

final getProjectsUseCaseProvider = Provider.autoDispose<GetProjects>((ref) {
  final repository = ref.watch(projectsRepositoryProvider);
  return GetProjects(repository: repository);
});
