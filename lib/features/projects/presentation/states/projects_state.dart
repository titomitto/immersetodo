import 'package:core/core.dart';

import '../../domain/entities/project.dart';

abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsData extends ProjectsState {
  final List<Project> projects;
  ProjectsData(this.projects);
}

class ProjectsEmpty extends ProjectsState {
  ProjectsEmpty();
}

class ProjectsError extends ProjectsState {
  final Failure failure;
  ProjectsError(this.failure);
}
