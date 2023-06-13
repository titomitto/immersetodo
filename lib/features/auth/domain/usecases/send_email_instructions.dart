import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/auth/domain/validators/phone_number_validator.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../repositories/auth_repository.dart';

class SendEmailInstructions extends UseCase<void, SendEmailInstructionsParams> {
  AuthRepository repository;
  EmailValidator validator;
  SendEmailInstructions({
    required this.repository,
    required this.validator,
  });
  @override
  Future<Either<Failure, void>> call(SendEmailInstructionsParams params) async {
    var validationFailure = validator.validate(params.email);

    if (validationFailure != null) return Left(validationFailure);

    return repository.sendEmailInstructions(
      params.email,
    );
  }
}

class SendEmailInstructionsParams {
  String email;

  SendEmailInstructionsParams({
    required this.email,
  });
}

final sendEmailInstructionsUseCaseProvider =
    Provider.autoDispose<SendEmailInstructions>((ref) {
  return SendEmailInstructions(
    repository: ref.watch(authRepositoryProvider),
    validator: ref.watch(emailValidatorProvider),
  );
});
