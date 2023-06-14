import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth.dart';
import '../projects/projects.dart';
import '../settings/presentation/screens/settings_screen.dart';
import '../stats/presentation/screens/stats_screen.dart';
import 'presentation/screens/home_screen.dart';
import '../../widgets/app_scaffold.dart';

class HomeFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        ShellRoute(
          builder: (context, state, child) {
            return AppScaffold(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
              path: HomeScreen.routePath,
              builder: (context, state) => const HomeScreen(),
              redirect: (context, state) {
                final ref = ProviderScope.containerOf(context);
                final authState = ref.read(authStateProvider);

                if (authState is! Authenticated) {
                  return LoginScreen.routePath;
                }

                return null;
              },
            ),
            GoRoute(
              path: ProjectsScreen.routePath,
              builder: (BuildContext context, GoRouterState state) {
                return const ProjectsScreen();
              },
            ),
            GoRoute(
              path: StatsScreen.routePath,
              builder: (BuildContext context, GoRouterState state) {
                return const StatsScreen();
              },
            ),
            GoRoute(
              path: SettingsScreen.routePath,
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
            ),
          ],
        ),
      ];
}
