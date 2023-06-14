import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  static String get routePath => "/stats";
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Stats',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
