import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../auth/auth.dart';
import 'presentation/screens/home_screen.dart';

class HomeFeature extends Feature {
  @override
  List<GoRoute> get routes => [
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
      ];
}
