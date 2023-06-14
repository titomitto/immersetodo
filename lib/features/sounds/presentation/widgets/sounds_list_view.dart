import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/sounds/presentation/controllers/sounds_controller.dart';
import 'package:immersetodo/features/sounds/presentation/widgets/sound_player.dart';
import 'package:immersetodo/utils/utils.dart';

import '../states/sounds_state.dart';

class SoundsListView extends ConsumerWidget {
  const SoundsListView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final soundState = ref.watch(soundsStateProvider);
    if (soundState is SoundsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (soundState is SoundsError) {
      return Center(
        child: Text(soundState.failure.toMessage(context)),
      );
    }

    return Wrap(
      children: soundState.sounds
          .map((sound) => SoundPlayer(
                isSelected: false,
                sound: sound,
                onTap: () {},
              ))
          .toList(),
    );
  }
}
