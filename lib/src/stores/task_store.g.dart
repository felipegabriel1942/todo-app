// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStore, Store {
  late final _$descriptionAtom =
      Atom(name: '_TaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$openTasksAtom =
      Atom(name: '_TaskStore.openTasks', context: context);

  @override
  ObservableList<Task> get openTasks {
    _$openTasksAtom.reportRead();
    return super.openTasks;
  }

  @override
  set openTasks(ObservableList<Task> value) {
    _$openTasksAtom.reportWrite(value, super.openTasks, () {
      super.openTasks = value;
    });
  }

  late final _$closedTasksAtom =
      Atom(name: '_TaskStore.closedTasks', context: context);

  @override
  ObservableList<Task> get closedTasks {
    _$closedTasksAtom.reportRead();
    return super.closedTasks;
  }

  @override
  set closedTasks(ObservableList<Task> value) {
    _$closedTasksAtom.reportWrite(value, super.closedTasks, () {
      super.closedTasks = value;
    });
  }

  late final _$deleteAsyncAction =
      AsyncAction('_TaskStore.delete', context: context);

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  late final _$insertAsyncAction =
      AsyncAction('_TaskStore.insert', context: context);

  @override
  Future<void> insert() {
    return _$insertAsyncAction.run(() => super.insert());
  }

  late final _$updateAsyncAction =
      AsyncAction('_TaskStore.update', context: context);

  @override
  Future<void> update(Task task) {
    return _$updateAsyncAction.run(() => super.update(task));
  }

  late final _$_findTasksAsyncAction =
      AsyncAction('_TaskStore._findTasks', context: context);

  @override
  Future<void> _findTasks() {
    return _$_findTasksAsyncAction.run(() => super._findTasks());
  }

  late final _$_findOpenTasksAsyncAction =
      AsyncAction('_TaskStore._findOpenTasks', context: context);

  @override
  Future<void> _findOpenTasks() {
    return _$_findOpenTasksAsyncAction.run(() => super._findOpenTasks());
  }

  late final _$_findClosedTasksAsyncAction =
      AsyncAction('_TaskStore._findClosedTasks', context: context);

  @override
  Future<void> _findClosedTasks() {
    return _$_findClosedTasksAsyncAction.run(() => super._findClosedTasks());
  }

  late final _$_TaskStoreActionController =
      ActionController(name: '_TaskStore', context: context);

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_TaskStoreActionController.startAction(
        name: '_TaskStore.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_TaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
description: ${description},
openTasks: ${openTasks},
closedTasks: ${closedTasks}
    ''';
  }
}
