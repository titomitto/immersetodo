import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:immersetodo/features/pomodoro/presentation/widgets/pomodoro_loader.dart';

class PomodoroScreen extends StatelessWidget {
  static String get routePath => "/pomodoro";
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(FeatherIcons.x),
              ),
            ]),
            Expanded(
              child: PomodoroLoader(
                onTimerTap: () {},
                onLabelTap: () {},
                onStopTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
