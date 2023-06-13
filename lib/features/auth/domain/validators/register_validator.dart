import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/register.dart';
import 'failures.dart';

class RegisterValidator extends Validator<RegisterParams> {
  ValidationFailure? validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return RequiredNameFailure();
    }
    return null;
  }

  ValidationFailure? validateEmail(String email) {
    if (email.isEmpty) {
      return RequiredEmailFailure();
    }
    return null;
  }

  ValidationFailure? validatePassword(String password) {
    if (password.isEmpty) {
      return RequiredPasswordFailure();
    }
    if (password.length < 6) {
      return PasswordLengthFailure();
    }
    return null;
  }

  @override
  ValidationFailure? validate(RegisterParams params) {
    final fullNameFailure = validateEmail(params.fullName);
    final emailFailure = validateEmail(params.email);
    final passwordFailure = validatePassword(params.password);

    if (fullNameFailure != null) {
      return fullNameFailure;
    }

    if (emailFailure != null) {
      return emailFailure;
    }

    if (passwordFailure != null) {
      return passwordFailure;
    }

    return null;
  }
}

final registerValidatorProvider = Provider.autoDispose<RegisterValidator>(
  (ref) => RegisterValidator(),
);
