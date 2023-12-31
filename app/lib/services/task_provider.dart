import 'package:flutter/material.dart';
import 'package:app/models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task("Task 1", "John Doe", DateTime.parse("20120227")),
    Task("Task 2", "Alice Smith", DateTime.parse("20120227")),
    Task("Task 3", "Bob Johnson", DateTime.parse("20120227")),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }
}
