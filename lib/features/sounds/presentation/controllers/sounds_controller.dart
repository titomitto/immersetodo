import 'package:immersetodo/features/sounds/domain/domain.dart';
import 'package:riverpod/riverpod.dart';

import '../states/sounds_state.dart';

class SoundsController extends StateNotifier<SoundsState> {
  StateNotifierProviderRef ref;
  GetSounds getSoundsUseCase;
  SoundsController(this.ref, this.getSoundsUseCase) : super(SoundsInitial()) {
    getSounds();
  }

  Future<void> getSounds() async {
    state = SoundsLoading(state.sounds);

    var response = await getSoundsUseCase();

    response.fold((failure) {
      state = SoundsError(failure);
    }, (sounds) {
      if (sounds.isEmpty) {
        state = SoundsEmpty();
        return;
      }
      state = SoundsData(sounds);
    });
  }
}

final soundsStateProvider =
    StateNotifierProvider.autoDispose<SoundsController, SoundsState>((ref) {
  GetSounds getProjectUseCase = ref.watch(getSoundsUseCaseProvider);
  return SoundsController(ref, getProjectUseCase);
});
