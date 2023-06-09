import 'package:dukasoft/app.dart';
import 'package:dukasoft/core/core.dart';
import 'package:dukasoft/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await features.preregister();

  runApp(
    ProviderScope(
      observers: [Logger()],
      child: App(),
    ),
  );
}
