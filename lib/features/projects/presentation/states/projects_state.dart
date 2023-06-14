import 'package:core/core.dart';

import '../../domain/entities/project.dart';

sealed class ProjectsState {
  final List<Project> projects;
  const ProjectsState(this.projects);
}

class ProjectsInitial extends ProjectsState {
  ProjectsInitial() : super([]);
}

class ProjectsLoading extends ProjectsState {
  ProjectsLoading(super.projects);
}

class ProjectsData extends ProjectsState {
  ProjectsData(super.projects);
}

class ProjectsEmpty extends ProjectsState {
  ProjectsEmpty() : super([]);
}

class ProjectsError extends ProjectsState {
  final Failure failure;
  ProjectsError(this.failure) : super([]);
}
