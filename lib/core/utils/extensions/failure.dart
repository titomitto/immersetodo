import 'package:dukasoft/core/core.dart';
import 'package:flutter/material.dart';

extension FailureMessage on Failure {
  toMessage(BuildContext context) => mapFailureToMessage(context, this);
}

extension FailureSnackBar on Failure {
  showSnackBar(BuildContext context) =>
      context.showErrorSnackBar(toMessage(context));
}
