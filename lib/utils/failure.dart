import 'package:core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String mapFailureToMessage(context, Failure failure) {
  if (failure is NetworkFailure) {
    return AppLocalizations.of(context).networkFailed;
  }

  if (failure is ValidationFailure) {
    return AppLocalizations.of(context).validationFailed;
  }

  if (failure is AppwriteFailure) {
    return failure.message;
  }

  return AppLocalizations.of(context).somethingWentWrong;
}
