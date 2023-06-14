import '../../domain/entities/task.dart';
import '../models/task_model.dart';

extension ExpenseModelExtension on TaskModel {
  Task toEntity() => Task(
        id: id!,
        title: title,
        description: description,
        isDone: isDone,
      );
}

extension ExpenseEntityExtension on Task {
  TaskModel toModel() => TaskModel(
        id: id,
        title: title,
        description: description,
        isDone: isDone,
      );
}
