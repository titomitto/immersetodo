import 'package:core/core.dart';

abstract class TaskState {
  const TaskState();
}

class TaskInitial extends TaskState {}

class TaskSaving extends TaskState {}

class TaskAdded extends TaskState {}

class TaskFailed extends TaskState {
  final Failure failure;
  TaskFailed(this.failure);
}
