import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordVisibilityController extends StateNotifier<bool> {
  PasswordVisibilityController() : super(false);

  void toggleVisibility() {
    state = !state;
  }
}

final passwordVisibilityProvider =
    StateNotifierProvider.autoDispose<PasswordVisibilityController, bool>(
        (ref) {
  return PasswordVisibilityController();
});
