import 'dart:developer';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/projects/projects.dart';

class ProjectsRepositoryImpl extends ProjectsRepository {
  final ProjectsRemoteDataSource localDataSource;

  ProjectsRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Unit>> updateProject(Project project) async {
    try {
      await localDataSource.updateProject(project.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> createProject(String title) async {
    try {
      await localDataSource.addProject(title);
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      var projectModels = await localDataSource.getProjects();
      var projects = projectModels.map((e) => e.toEntity()).toList();
      return Right(projects);
    } catch (e) {
      log("$e");
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProject(Project project) async {
    try {
      await localDataSource.deleteProject(project.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}

final projectsRepositoryProvider =
    Provider.autoDispose<ProjectsRepository>((ref) {
  final projectsLocalDataSource = ref.watch(projectsLocalDataSourceProvider);
  return ProjectsRepositoryImpl(localDataSource: projectsLocalDataSource);
});
