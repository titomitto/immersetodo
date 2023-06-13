import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

import '../usecases/add_task.dart';

var taskValidatorProvider = Provider<TaskValidator>((ref) {
  return TaskValidator();
});

class EmptyFieldFailure implements ValidationFailure {}

class TaskValidator implements Validator<AddTaskParams> {
  static ValidationFailure? validateTitle(String title) {
    if (title.isEmpty) {
      return EmptyFieldFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(AddTaskParams params) {
    final titleFailure = validateTitle(params.title);

    if (titleFailure != null) {
      return titleFailure;
    }

    return null;
  }
}
