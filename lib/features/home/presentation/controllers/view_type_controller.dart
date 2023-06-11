import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewTypeProvider = StateNotifierProvider<ViewTypeController, bool>((ref) {
  return ViewTypeController();
});

class ViewTypeController extends StateNotifier<bool> {
  ViewTypeController() : super(true);

  void toggleView() {
    state = !state;
  }
}
