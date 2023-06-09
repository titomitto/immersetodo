import 'dart:developer';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String mapFailureToMessage(context, Failure failure) {
  if (failure is NetworkFailure) {
    return AppLocalizations.of(context)!.networkFailed;
  }

  if (failure is CacheException) {
    return AppLocalizations.of(context)!.cacheGetFailed;
  }

  if (failure is CacheDeleteFailure) {
    return AppLocalizations.of(context)!.cacheDeleteFailed;
  }

  if (failure is ValidationFailure) {
    return AppLocalizations.of(context)!.validationFailed;
  }

  if (failure is NoInternetFailure) {
    return AppLocalizations.of(context)!.noInternetConnection;
  }

  if (failure is ServerFailure) {
    return AppLocalizations.of(context)!.serverExceptionMessage;
  }

  if (failure is InvalidArgFailure) {
    return AppLocalizations.of(context)!.invalidArgument;
  }

  if (failure is NotFoundFailure) {
    return AppLocalizations.of(context)!.notFound;
  }

  if (failure is InvalidArgumentFailure) {
    return AppLocalizations.of(context)!.invalidArgument;
  }

  if (failure is ServerValidationFailure) {
    return AppLocalizations.of(context)!.serverValidationFailed;
  }

  log("Unknown failure: $failure");
  return AppLocalizations.of(context)!.somethingWentWrong;
}
