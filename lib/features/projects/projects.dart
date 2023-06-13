import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'presentation/screens/add_project_screen.dart';

export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class ProjectsFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: AddProjectScreen.routePath,
          builder: (_, state) => const AddProjectScreen(),
        ),
      ];
  @override
  Future<void> preregister() async {}
}
