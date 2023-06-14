import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immersetodo/features/sounds/presentation/states/sounds_player_state.dart';

import '../../domain/entities/sound.dart';
import '../controllers/sound_player_controller.dart';

class SoundPlayer extends ConsumerWidget {
  final Sound sound;
  final bool isSelected;
  final Function onTap;
  const SoundPlayer({
    super.key,
    required this.sound,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, ref) {
    final soundPlayerController =
        ref.watch(soundsPlayerStateProvider(sound.sound).notifier);
    final soundPlayerState = ref.watch(soundsPlayerStateProvider(sound.sound));
    log("Chat");
    return GestureDetector(
      onTap: () async {
        if (soundPlayerState is SoundPlayerPlaying) {
          soundPlayerController.pause();
          return;
        }
        soundPlayerController.play();
      },
      child: Container(
        width: 120.0,
        height: 115.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.all(10.0).copyWith(bottom: 0.0, top: 0.0),
              child: CachedNetworkSVGImage(
                sound.image,
                placeholder:
                    const CircularProgressIndicator(color: Colors.black),
                errorWidget: const Icon(Icons.error, color: Colors.red),
                width: 50.0,
                height: 50.0,
                color: Colors.black54,
                fadeDuration: const Duration(milliseconds: 500),
              ),
            ),
            if (soundPlayerState is SoundPlayerPlaying)
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 2.0,
                    thumbColor: Colors.black,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 9.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 18.0),
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 1.0,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey.shade200,
                    value: soundPlayerState.volume,
                    onChanged: (value) {
                      soundPlayerController.setVolume(value);
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
