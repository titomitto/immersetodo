import 'package:flutter/material.dart';
import 'package:immersetodo/features/pomodoro/presentation/widgets/pomodoro_loader.dart';

class PomodoroScreen extends StatelessWidget {
  static String get routePath => "/pomodoro";
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PomodoroLoader(
        onTimerTap: () {},
        onLabelTap: () {},
        onStopTap: () {},
      ),
    );
  }
}
