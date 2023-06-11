import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/login.dart';
import '../../domain/usecases/logout.dart';
import '../../domain/usecases/register.dart';
import '../states/auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  Login loginUseCase;
  Register registerUseCase;
  Logout logoutUseCase;
  GetUser getUserUseCase;
  AuthController({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getUserUseCase,
    required this.logoutUseCase,
  }) : super(LoginInitial());

  Future<void> getUser() async {
    state = LoggingIn();

    final response = await getUserUseCase();

    response.fold((failure) {
      state = LoginError(failure);
    }, (User user) {
      state = Authenticated(user);
    });
  }

  void login({
    required String email,
    required String password,
  }) async {
    state = LoggingIn();

    final response = await loginUseCase(LoginParams(
      email: email,
      password: password,
    ));

    response.fold((failure) {
      state = LoginError(failure);
    }, (User user) {
      state = Authenticated(
        user,
      );
    });
  }

  void register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    state = Registering();

    final response = await registerUseCase(RegisterParams(
      fullName: fullName,
      email: email,
      password: password,
    ));

    response.fold((failure) {
      state = RegistrationError(failure);
    }, (_) {
      state = RegistrationSuccessful();
    });
  }

  Future<void> logout() async {
    state = LoggingIn();
    final response = await logoutUseCase();
    response.fold((failure) {
      state = LoginError(failure);
    }, (success) {
      state = Unauthenticated();
    });
  }
}

final authStateProvider =
    StateNotifierProvider.autoDispose<AuthController, AuthState>((ref) {
  return AuthController(
    registerUseCase: ref.watch(registerUseCaseProvider),
    loginUseCase: ref.watch(loginUseCaseProvider),
    getUserUseCase: ref.watch(getAuthDataUseCaseProvider),
    logoutUseCase: ref.watch(logOutUseCaseProvider),
  );
});
