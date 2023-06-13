import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class DeleteTaskParams {
  Task task;
  DeleteTaskParams({
    required this.task,
  });
}

class DeleteTask extends UseCase<void, DeleteTaskParams> {
  TasksRepository repository;

  DeleteTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(DeleteTaskParams params) {
    return repository.deleteTask(params.task);
  }
}

final deleteTaskUseCaseProvider = Provider<DeleteTask>((ref) {
  final repository = ref.read(tasksRepositoryProvider);
  return DeleteTask(repository: repository);
});
