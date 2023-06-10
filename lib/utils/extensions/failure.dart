import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../failure.dart';
import 'context.dart';

extension FailureMessage on Failure {
  toMessage(BuildContext context) => mapFailureToMessage(context, this);
}

extension FailureSnackBar on Failure {
  showSnackBar(BuildContext context) =>
      context.showErrorSnackBar(toMessage(context));
}
