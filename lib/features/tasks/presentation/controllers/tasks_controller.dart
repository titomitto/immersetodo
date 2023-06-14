import 'package:riverpod/riverpod.dart';
import '../../domain/domain.dart';
import '../states/tasks_state.dart';

class TasksController extends StateNotifier<TasksState> {
  final GetTasks getTasksUseCase;
  final DeleteTask deleteTask;
  final UpdateTask updateTask;
  TasksController({
    required this.getTasksUseCase,
    required this.deleteTask,
    required this.updateTask,
  }) : super(TasksInitial()) {
    getTasks();
  }

  Future<void> getTasks() async {
    state = TasksLoading(state.tasks);

    var response = await getTasksUseCase();

    response.fold((failure) {
      state = TasksFailed(failure);
    }, (tasks) {
      if (tasks.isEmpty) {
        state = TasksEmpty();
        return;
      }
      state = TasksData(tasks);
    });
  }

  void removeTask(Task task) async {
    var filteredTasks =
        state.tasks.where((element) => element != task).toList();

    state = TasksLoading(filteredTasks);
    var response = await deleteTask(DeleteTaskParams(task: task));

    await response.fold((failure) {
      state = TasksFailed(failure);
    }, (_) async {
      state = TaskDeleted(state.tasks);
    });
  }

  void toggle(Task task) async {
    var updatedTasks = state.tasks.map((e) {
      if (e.id == task.id) {
        return task.copyWith(isDone: !task.isDone);
      }
      return e;
    }).toList();

    state = TasksLoading(updatedTasks);

    var response = await updateTask(
      UpdateTaskParams(
        task: task.copyWith(
          isDone: !task.isDone,
        ),
      ),
    );

    response.fold((failure) {
      state = TasksFailed(failure);
    }, (_) {
      state = TaskUpdated(
        updatedTasks,
      );
    });
  }
}

final tasksProvider =
    StateNotifierProvider.autoDispose<TasksController, TasksState>((ref) {
  GetTasks getTasksUseCase = ref.watch(getTasksUseCaseProvider);
  DeleteTask deleteTask = ref.watch(deleteTaskUseCaseProvider);
  UpdateTask updateTask = ref.watch(updateTaskUseCaseProvider);
  return TasksController(
    getTasksUseCase: getTasksUseCase,
    deleteTask: deleteTask,
    updateTask: updateTask,
  );
});
