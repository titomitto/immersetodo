import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  static String routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        alignment: AlignmentDirectional.center,
        child: const Text("Splash"),
      ),
    );
  }
}
