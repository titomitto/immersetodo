import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

abstract class OnboardingLocalDatasource {
  Future<void> completeOnboarding();
  Future<bool> getOnboardingStatus();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDatasource {
  Future<Box> getBox;
  final isCompleteKey = "isComplete";
  OnboardingLocalDataSourceImpl(this.getBox);

  @override
  Future<bool> getOnboardingStatus() async {
    try {
      final box = await getBox;
      bool value = await box.get(isCompleteKey, defaultValue: false);
      return value;
    } catch (e, s) {
      log("CACHE_GET_ERROR $e,$s");
      throw CacheException();
    }
  }

  @override
  Future<void> completeOnboarding() async {
    try {
      final box = await getBox;
      await box.put(isCompleteKey, true);
    } catch (e, s) {
      log("CACHE_PUT_ERROR $e, $s");
      throw CacheException();
    }
  }
}

final onboardingLocalDatasourceProvider =
    Provider.autoDispose<OnboardingLocalDatasource>((ref) {
  final box = ref.watch(onboardingBoxProvider.future);
  return OnboardingLocalDataSourceImpl(box);
});

final onboardingBoxProvider = FutureProvider.autoDispose<Box>((ref) async {
  final box = await Hive.openBox("onboarding");
  ref.onDispose(() async {
    await box.close();
  });
  return box;
});
