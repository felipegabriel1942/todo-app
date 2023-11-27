import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  late Database _database;

  Future<Database> get database async {
    await open();
    return _database;
  }

  Future open() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, description TEXT, completed INTEGER, createdAt TEXT)');
      },
    );
  }
}
