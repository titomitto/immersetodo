import 'dart:developer';
import 'package:flutter_gen/gen_l10n/core_localizations.dart';
import '../../core.dart';

String mapFailureToMessage(context, Failure failure) {
  if (failure is NetworkFailure) {
    return AppLocalizations.of(context)!.networkFailed;
  }

  log("Unknown failure: $failure");
  return AppLocalizations.of(context)!.somethingWentWrong;
}
