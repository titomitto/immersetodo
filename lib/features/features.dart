import 'package:core/core.dart';
import 'package:immersetodo/features/home/home.dart';
import 'package:immersetodo/features/tasks/tasks.dart';

import 'auth/auth.dart';
import 'onboarding/onboarding.dart';
import 'projects/projects.dart';

List<Feature> features = [
  OnboardingFeature(),
  AuthFeature(),
  HomeFeature(),
  TasksFeature(),
  ProjectsFeature(),
];
