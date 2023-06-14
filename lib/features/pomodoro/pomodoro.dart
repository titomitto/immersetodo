import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/config/go_router.dart';

import 'presentation/screens/pomodoro_screen.dart';

class PomodoroFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          parentNavigatorKey: parentNavigatorKey,
          path: PomodoroScreen.routePath,
          builder: (_, state) => const PomodoroScreen(),
        ),
      ];

  @override
  Future<void> preregister() async {}
}
