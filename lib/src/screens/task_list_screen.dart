import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/routes/app_routes.dart';
import 'package:todo_app/src/stores/task_store.dart';
import 'package:todo_app/src/widgets/task_list_v2.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    final TaskStore store = GetIt.I<TaskStore>();

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Minhas Tarefas'),
              bottom: const TabBar(
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                tabs: [
                  Tab(
                    text: 'Em Aberto',
                  ),
                  Tab(
                    text: 'Finalizadas',
                  ),
                ],
                labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
              ),
            ),
            body: TabBarView(
              children: [
                Observer(
                  builder: (_) => TaskListV2(tasks: store.openTasks.toList()),
                ),
                Observer(
                  builder: (_) => TaskListV2(tasks: store.closedTasks.toList()),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.formScreen);
              },
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
