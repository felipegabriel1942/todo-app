import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/repositories/task_repository.dart';

part 'task_store.g.dart';

class TaskStore = _TaskStore with _$TaskStore;

abstract class _TaskStore with Store {
  _TaskStore() {
    _findTasks();
  }

  @observable
  String description = '';

  @observable
  ObservableList<Task> openTasks = ObservableList();

  @observable
  ObservableList<Task> closedTasks = ObservableList();

  @action
  Future<void> delete(int id) async {
    await GetIt.I<TaskRepository>().delete(id);
    await _findTasks();
  }

  @action
  Future<void> insert() async {
    final task = Task(
      completed: false,
      description: description,
      createdAt: DateTime.now(),
    );

    await GetIt.I<TaskRepository>().insert(task);
    await _findTasks();
  }

  @action
  Future<void> update(Task task) async {
    await GetIt.I<TaskRepository>().update(task);
    await _findTasks();
  }

  @action
  void setDescription(String description) {
    this.description = description;
  }

  @action
  Future<void> _findTasks() async {
    await _findClosedTasks();
    await _findOpenTasks();
  }

  @action
  Future<void> _findOpenTasks() async {
    openTasks.clear();
    openTasks.addAll(await GetIt.I<TaskRepository>().findByCompleted(false));
  }

  @action
  Future<void> _findClosedTasks() async {
    closedTasks.clear();
    closedTasks.addAll(await GetIt.I<TaskRepository>().findByCompleted(true));
  }
}
