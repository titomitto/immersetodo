import 'package:dukasoft/core/core.dart';
import 'package:go_router/go_router.dart';

extension PreRegistration on List<Feature> {
  Future<void> preregister() async {
    for (var feature in this) {
      await feature.preregister();
    }
  }
}

extension Routes on List<Feature> {
  List<RouteBase> get routes {
    return this.expand((e) => e.routes).toList();
  }
}
