import 'package:core/core.dart';

import '../../domain/entities/task.dart';

sealed class TasksState {
  final List<Task> tasks;
  const TasksState(this.tasks);
}

class TasksInitial extends TasksState {
  TasksInitial() : super([]);
}

class TasksLoading extends TasksState {
  TasksLoading(super.tasks);
}

class TasksData extends TasksState {
  TasksData(super.tasks);
}

class TasksEmpty extends TasksState {
  TasksEmpty() : super([]);
}

class TasksFailed extends TasksState {
  final Failure failure;
  TasksFailed(this.failure) : super([]);
}

class TaskDeleted extends TasksState {
  TaskDeleted(super.tasks);
}

class TaskUpdated extends TasksState {
  TaskUpdated(super.tasks);
}
