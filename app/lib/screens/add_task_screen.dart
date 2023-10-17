import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/task.dart';
import 'package:app/services/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController assigneeController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: taskNameController,
              decoration: InputDecoration(labelText: "Task Name"),
            ),
            TextField(
              controller: assigneeController,
              decoration: InputDecoration(labelText: "Assignee"),
            ),
            TextField(
              controller: dueDateController,
              decoration: InputDecoration(labelText: "Due Date (YYYY-MM-DD)"),
            ),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  taskNameController.text,
                  assigneeController.text,
                  dueDateController.text,
                );

                // Use the TaskProvider to add the new task
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(newTask);

                Navigator.pop(context);
              },
              child: Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
