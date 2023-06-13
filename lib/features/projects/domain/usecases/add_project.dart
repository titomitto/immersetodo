import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/projects_repository_impl.dart';
import '../repositories/project_repository.dart';
import '../validators/task_validator.dart';

class AddProjectParams {
  String title;
  AddProjectParams({
    required this.title,
  });
}

class AddProject extends UseCase<void, AddProjectParams> {
  ProjectsRepository repository;
  ProjectValidator validator;

  AddProject({
    required this.repository,
    required this.validator,
  });

  @override
  Future<Either<Failure, void>> call(AddProjectParams params) async {
    ValidationFailure? validationFailure = validator.validate(params);

    if (validationFailure != null) {
      return Left(validationFailure);
    }

    return repository.createProject(params.title);
  }
}

final addProjectUseCaseProvider = Provider<AddProject>((ref) {
  final validator = ProjectValidator();
  final repository = ref.read(projectsRepositoryProvider);
  return AddProject(
    repository: repository,
    validator: validator,
  );
});
