import 'package:core/core.dart';
import 'package:go_router/go_router.dart';
import 'presentation/screens/add_task_screen.dart';

export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class TasksFeature extends Feature {
  @override
  List<RouteBase> get routes => [
        GoRoute(
          path: AddTaskScreen.routePath,
          builder: (_, state) => const AddTaskScreen(),
        ),
      ];
  @override
  Future<void> preregister() async {}
}
