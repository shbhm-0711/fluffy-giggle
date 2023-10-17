import 'package:flutter/material.dart';
import 'package:app/models/task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].taskName),
          subtitle: Text(
              "Assignee: ${tasks[index].assignee}\nDue Date: ${(tasks[index].dueDate as DateTime)}"),
        );
      },
    );
  }
}
