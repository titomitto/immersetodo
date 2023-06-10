import 'package:immersetodo/config/images.dart';
import 'package:flutter/material.dart';

class SplashBanner extends StatelessWidget {
  const SplashBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Image.asset(Images.appIcon),
    );
  }
}
