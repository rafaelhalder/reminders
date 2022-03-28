import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:reminders/models/todo_list/todo_list.dart';

class TodoListCollection with ChangeNotifier {
  final List<TodoList> _todoLists = [];

  @override
  String toString() {
    return 'helou';
  }

  UnmodifiableListView get todoLists => UnmodifiableListView(_todoLists);

  addTodoList(TodoList todoList) {
    _todoLists.add(todoList);
    notifyListeners();
  }

  removeTodoList(TodoList todoList) {
    _todoLists.removeWhere((element) => element.id == todoList.id);
    notifyListeners();
  }
}
