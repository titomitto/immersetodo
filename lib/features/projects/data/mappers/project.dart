import '../../domain/entities/project.dart';
import '../models/project_model.dart';

extension ExpenseModelExtension on ProjectModel {
  Project toEntity() => Project(
        id: id!,
        name: name,
      );
}

extension ExpenseEntityExtension on Project {
  ProjectModel toModel() => ProjectModel(
        id: id,
        name: name,
      );
}
