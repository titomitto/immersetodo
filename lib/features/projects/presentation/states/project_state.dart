import 'package:core/core.dart';

abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class SavingProject extends ProjectState {}

class ProjectAdded extends ProjectState {}

class ProjectDeleted extends ProjectState {}

class ProjectUpdated extends ProjectState {}

class ProjectFailed extends ProjectState {
  final Failure failure;
  ProjectFailed(this.failure);
}
