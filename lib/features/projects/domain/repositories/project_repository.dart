import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;

import '../entities/project.dart';

abstract class ProjectsRepository {
  Future<Either<Failure, List<Project>>> getProjects();
  Future<Either<Failure, Unit>> createProject(String name);
  Future<Either<Failure, Unit>> updateProject(Project project);
  Future<Either<Failure, Unit>> deleteProject(Project project);
}
