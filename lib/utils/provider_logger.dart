import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
      {
        "provider": "${provider.name ?? provider.runtimeType}",
        "newValue": "$newValue"
      }
    ''',
    );
  }
}
