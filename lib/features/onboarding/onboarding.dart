import 'package:core/core.dart';
import 'package:go_router/go_router.dart';

import 'presentation/presentation.dart';

export 'presentation/presentation.dart';

class OnboardingFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: SplashScreen.routePath,
          builder: (context, state) => const SplashScreen(),
          redirect: (context, state) {
            // if(s)
            return null;
          },
        ),
        GoRoute(
          path: OnboardingScreen.routePath,
          builder: (context, state) => const OnboardingScreen(),
          redirect: (context, state) {
            return null;
          },
        ),
      ];
}
