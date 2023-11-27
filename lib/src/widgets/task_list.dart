import 'package:flutter/material.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  final Future<List<Task>> Function() fetchTasks;

  const TaskList({
    super.key,
    required this.fetchTasks,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Task>>(
      future: fetchTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<Task> tasks = snapshot.data ?? [];
          return tasks.isNotEmpty
              ? ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => TaskTile(
                    task: tasks.elementAt(index),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Não existem tarefas.'),
                );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
