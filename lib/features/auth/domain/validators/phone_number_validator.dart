import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'failures.dart';

class EmailValidator extends Validator<String> {
  ValidationFailure? validateEmail(String email) {
    if (email.isEmpty) {
      return RequiredEmailFailure();
    }
    if (email.length < 9) {
      return EmailLengthFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(String email) {
    final emailError = validateEmail(email);

    if (emailError != null) {
      return emailError;
    }

    return null;
  }
}

final emailValidatorProvider = Provider(
  (ref) => EmailValidator(),
);
