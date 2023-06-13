import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'failures.dart';

class EmailValidator extends Validator<String> {
  ValidationFailure? validateEmail(String email) {
    if (email.isEmpty) {
      return RequiredEmailFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(String params) {
    final emailError = validateEmail(params);

    if (emailError != null) {
      return emailError;
    }

    return null;
  }
}

final emailValidatorProvider = Provider(
  (ref) => EmailValidator(),
);
