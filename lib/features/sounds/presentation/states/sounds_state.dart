import 'package:core/core.dart';

import '../../domain/entities/sound.dart';

sealed class SoundsState {
  final List<Sound> sounds;
  const SoundsState(this.sounds);
}

class SoundsInitial extends SoundsState {
  SoundsInitial() : super([]);
}

class SoundsLoading extends SoundsState {
  SoundsLoading(super.sounds);
}

class SoundsData extends SoundsState {
  SoundsData(super.sounds);
}

class SoundsEmpty extends SoundsState {
  SoundsEmpty() : super([]);
}

class SoundsError extends SoundsState {
  final Failure failure;
  SoundsError(this.failure) : super([]);
}
