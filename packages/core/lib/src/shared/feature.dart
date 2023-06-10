import 'package:go_router/go_router.dart';

abstract class Feature {
  List<RouteBase> routes = [];
  Future<void> preregister() async {}
}

extension PreRegistration on List<Feature> {
  Future<void> preregister() async {
    for (var feature in this) {
      await feature.preregister();
    }
  }
}

extension Routes on List<Feature> {
  List<RouteBase> get routes {
    return expand((e) => e.routes).toList();
  }
}
