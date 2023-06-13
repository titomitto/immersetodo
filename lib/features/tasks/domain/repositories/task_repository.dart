import 'package:core/core.dart';
import 'package:dartz/dartz.dart' hide Task;

import '../entities/task.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Future<Either<Failure, Unit>> createTask(String title);
  Future<Either<Failure, Unit>> updateTask(Task task);
  Future<Either<Failure, Unit>> deleteTask(Task task);
}
