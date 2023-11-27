import 'package:flutter/widgets.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/widgets/task_tile.dart';

class TaskListV2 extends StatelessWidget {
  final List<Task> tasks;

  const TaskListV2({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
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
  }
}
