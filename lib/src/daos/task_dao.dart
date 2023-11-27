import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/database/todo_database.dart';
import 'package:todo_app/src/models/task.dart';

class TaskDao {
  final TodoDatabase _todoDatabase;

  TaskDao(this._todoDatabase);

  Future<int> insert(Task task) async {
    Database db = await _todoDatabase.database;
    return await db.insert('tasks', task.toJson());
  }

  Future<List<Task>> findByCompleted(bool completed) async {
    Database db = await _todoDatabase.database;
    String query =
        'SELECT * FROM tasks WHERE completed = ${(completed ? 1 : 0)} ORDER BY id DESC';
    List<Map<String, Object?>> result = await db.rawQuery(query);
    return result.map((e) => Task.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    Database db = await _todoDatabase.database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Task task) async {
    Database db = await _todoDatabase.database;
    return await db
        .update('tasks', task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }
}
