sealed class SoundPlayerState {
  final double volume;
  const SoundPlayerState(this.volume);
}

class SoundPlayerInitial extends SoundPlayerState {
  SoundPlayerInitial() : super(0.5);
}

class SoundPlayerPlaying extends SoundPlayerState {
  SoundPlayerPlaying(super.volume);
}

class SoundPlayerPaused extends SoundPlayerState {
  SoundPlayerPaused(super.volume);
}

class SoundPlayerStopped extends SoundPlayerState {
  SoundPlayerStopped() : super(0.5);
}
