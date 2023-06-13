import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'data/data.dart';
import "presentation/presentation.dart";
import 'presentation/screens/forgot_password_screen.dart';

export 'presentation/presentation.dart';

class AuthFeature extends Feature {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: LoginScreen.routePath,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RegisterScreen.routePath,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: ForgotPasswordScreen.routePath,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
      ];
  @override
  Future<void> preregister() async {
    Hive.registerAdapter(UserModelAdapter());
  }
}
