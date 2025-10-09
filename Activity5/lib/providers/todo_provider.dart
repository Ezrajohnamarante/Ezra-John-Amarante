import 'package:flutter/material.dart';

class TodoItem {
  final String id;
  String title;
  bool isCompleted;

  TodoItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });
}

class TodoProvider with ChangeNotifier {
  final List<TodoItem> _todos = [];

  List<TodoItem> get todos => _todos;

  int get completedCount =>
      _todos.where((todo) => todo.isCompleted).length;

  int get pendingCount =>
      _todos.where((todo) => !todo.isCompleted).length;

  void addTodo(String title) {
    _todos.add(TodoItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    ));
    notifyListeners();
  }

  void toggleTodo(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index >= 0) {
      _todos[index].isCompleted = !_todos[index].isCompleted;
      notifyListeners();
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void updateTodo(String id, String newTitle) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index >= 0) {
      _todos[index].title = newTitle;
      notifyListeners();
    }
  }
}
