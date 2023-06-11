import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecases/login.dart';
import 'failures.dart';

class LoginValidator extends Validator<LoginParams> {
  ValidationFailure? validateEmail(String email) {
    if (email.isEmpty) {
      return RequiredEmailFailure();
    }
    if (email.length < 9) {
      return EmailLengthFailure();
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
  ValidationFailure? validate(LoginParams params) {
    final emailFailure = validateEmail(params.email);
    final passwordFailure = validatePassword(params.password);

    if (emailFailure != null) {
      return emailFailure;
    }

    if (passwordFailure != null) {
      return passwordFailure;
    }

    return null;
  }
}

final loginValidatorProvider = Provider(
  (ref) => LoginValidator(),
);
