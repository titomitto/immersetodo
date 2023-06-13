import 'package:riverpod/riverpod.dart';
import '../../domain/domain.dart';
import '../states/tasks_state.dart';

class TasksController extends StateNotifier<TasksState> {
  StateNotifierProviderRef ref;
  GetTasks getTasksUseCase;
  TasksController(this.ref, this.getTasksUseCase) : super(TasksInitial()) {
    getTasks();
  }

  Future<void> getTasks() async {
    state = TasksLoading();

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = TasksError(failure);
    }, (tasks) {
      if (tasks.isEmpty) {
        state = TasksEmpty();
        return;
      }
      state = TasksData(tasks);
    });
  }
}

final tasksProvider =
    StateNotifierProvider.autoDispose<TasksController, TasksState>((ref) {
  GetTasks getTaskUseCase = ref.watch(getTasksUseCaseProvider);
  return TasksController(ref, getTaskUseCase);
});
