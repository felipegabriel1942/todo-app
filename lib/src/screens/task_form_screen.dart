import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/stores/task_store.dart';

class TaskFormScreen extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  TaskFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TaskStore store = GetIt.I<TaskStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                store.insert();

                Navigator.of(context).pop(true);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tarefa criada com sucesso!'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: store.description,
                decoration: const InputDecoration(labelText: 'Descrição'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe uma descrição';
                  }

                  if (value.trim().length <= 5) {
                    return 'Descrição muito curta';
                  }

                  return null;
                },
                onSaved: (value) => {store.setDescription(value!)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
