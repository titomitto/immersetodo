import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTaskParams {
  Task task;
  UpdateTaskParams({
    required this.task,
  });
}

class UpdateTask extends UseCase<void, UpdateTaskParams> {
  TasksRepository repository;

  UpdateTask({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(UpdateTaskParams params) {
    return repository.updateTask(params.task);
  }
}

final updateTaskUseCaseProvider = Provider<UpdateTask>((ref) {
  final repository = ref.read(tasksRepositoryProvider);
  return UpdateTask(repository: repository);
});
