import 'package:audioplayers/audioplayers.dart';
import 'package:riverpod/riverpod.dart';
import '../states/sounds_player_state.dart';

class SoundPlayerController extends StateNotifier<SoundPlayerState> {
  final AudioPlayer player;
  final String url;
  SoundPlayerController(
    this.player,
    this.url,
  ) : super(SoundPlayerInitial());

  void play() {
    player.play(UrlSource(url));
    player.setVolume(state.volume);
    state = SoundPlayerPlaying(state.volume);
  }

  void pause() {
    player.pause();
    state = SoundPlayerPaused(state.volume);
  }

  void stop() {
    state = SoundPlayerStopped();
  }

  void setVolume(double volume) {
    player.setVolume(volume);
    state = SoundPlayerPlaying(volume);
  }
}

final soundsPlayerStateProvider = StateNotifierProvider.family<
    SoundPlayerController, SoundPlayerState, String>((ref, url) {
  final player = AudioPlayer();
  player.setReleaseMode(ReleaseMode.loop);
  player.setSourceUrl(url);
  return SoundPlayerController(
    player,
    url,
  );
});
