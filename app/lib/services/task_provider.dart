import 'package:flutter/material.dart';
import 'package:app/models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task("Task 1", "John Doe", "2023-10-20"),
    Task("Task 2", "Alice Smith", "2023-10-22"),
    Task("Task 3", "Bob Johnson", "2023-10-25"),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }
}
