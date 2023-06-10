import 'package:core/core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String mapFailureToMessage(context, Failure failure) {
  if (failure is NetworkFailure) {
    return AppLocalizations.of(context).networkFailed;
  }

  return AppLocalizations.of(context).somethingWentWrong;
}
