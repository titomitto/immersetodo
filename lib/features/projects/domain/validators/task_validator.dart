import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core/core.dart';

import '../usecases/add_project.dart';

var projectValidatorProvider = Provider<ProjectValidator>((ref) {
  return ProjectValidator();
});

class EmptyFieldFailure implements ValidationFailure {}

class ProjectValidator implements Validator<AddProjectParams> {
  static ValidationFailure? validateTitle(String title) {
    if (title.isEmpty) {
      return EmptyFieldFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(AddProjectParams params) {
    final titleFailure = validateTitle(params.title);

    if (titleFailure != null) {
      return titleFailure;
    }

    return null;
  }
}
