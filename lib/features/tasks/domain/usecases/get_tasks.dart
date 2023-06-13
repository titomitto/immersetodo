import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/tasks_repository_impl.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasks extends NoParamsUseCase<List<Task>> {
  TasksRepository repository;

  GetTasks({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Task>>> call() {
    return repository.getTasks();
  }
}

final getTasksUseCaseProvider = Provider.autoDispose<GetTasks>((ref) {
  final repository = ref.watch(tasksRepositoryProvider);
  return GetTasks(repository: repository);
});
