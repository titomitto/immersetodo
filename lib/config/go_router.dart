import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/controllers/auth_controller.dart';
import '../features/features.dart';
import '../features/onboarding/presentation/presentation.dart';

final parentNavigatorKey = GlobalKey<NavigatorState>();
final initialRoute = SplashScreen.routePath;

final router = GoRouter(
  navigatorKey: parentNavigatorKey,
  initialLocation: initialRoute,
  routes: features.routes,
  debugLogDiagnostics: true,
);

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  ref.watch(authStateProvider);
  return router;
});
