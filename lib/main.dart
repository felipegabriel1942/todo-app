import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/daos/task_dao.dart';
import 'package:todo_app/src/database/todo_database.dart';
import 'package:todo_app/src/repositories/task_repository.dart';
import 'package:todo_app/src/routes/app_routes.dart';
import 'package:todo_app/src/screens/task_form_screen.dart';
import 'package:todo_app/src/screens/task_list_screen.dart';
import 'package:todo_app/src/stores/task_store.dart';

void main() {
  setup();
  runApp(const MyApp());
}

void setup() async {
  GetIt.I.registerLazySingleton<TodoDatabase>(() => TodoDatabase());
  GetIt.I
      .registerLazySingleton<TaskDao>(() => TaskDao(GetIt.I<TodoDatabase>()));
  GetIt.I.registerLazySingleton<TaskRepository>(
      () => TaskRepository(GetIt.I<TaskDao>()));
  GetIt.I.registerLazySingleton<TaskStore>(() => TaskStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        useMaterial3: true,
      ),
      routes: {
        AppRoutes.listScreen: (_) => const TaskListScreen(),
        AppRoutes.formScreen: (_) => TaskFormScreen()
      },
    );
  }
}
