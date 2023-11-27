import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/models/task.dart';
import 'package:todo_app/src/stores/task_store.dart';
import 'package:todo_app/src/widgets/confirmation_dialog.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  const TaskTile({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    TaskStore store = GetIt.I<TaskStore>();

    return ListTile(
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? value) {
          task.completed = value!;
          store.update(task);
        },
      ),
      title: Text(
        task.description,
      ),
      subtitle: Text(
          'Criado em ${DateFormat('dd/MM/yyyy - kk:mm').format(task.createdAt)}'),
      trailing: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const ConfirmationDialog(
              title: 'Excluir tarefa',
              content: 'Deseja excluír a tarefa?',
              cancelText: 'Não',
              confirmText: 'Sim',
            ),
          ).then(
            (confirmation) => {
              if (confirmation)
                {
                  store.delete(task.id!),
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tarefa excluída com sucesso!'),
                    ),
                  )
                }
            },
          );
        },
      ),
    );
  }
}
