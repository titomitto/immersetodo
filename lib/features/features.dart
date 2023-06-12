import 'package:core/core.dart';
import 'package:immersetodo/features/home/home.dart';

import 'auth/auth.dart';
import 'onboarding/onboarding.dart';

List<Feature> features = [
  OnboardingFeature(),
  AuthFeature(),
  HomeFeature(),
];
