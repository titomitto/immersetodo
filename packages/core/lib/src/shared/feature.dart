import 'package:go_router/go_router.dart';

abstract class Feature {
  List<RouteBase> routes = [];
  Future<void> preregister() async {}
}
