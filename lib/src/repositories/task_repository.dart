import 'package:todo_app/src/daos/task_dao.dart';
import 'package:todo_app/src/models/task.dart';

class TaskRepository {
  final TaskDao _taskDao;

  TaskRepository(this._taskDao);

  Future<int> insert(Task task) => _taskDao.insert(task);

  Future<List<Task>> findByCompleted(bool completed) =>
      _taskDao.findByCompleted(completed);

  Future<int> delete(int id) => _taskDao.delete(id);

  Future<int> update(Task task) => _taskDao.update(task);
}
