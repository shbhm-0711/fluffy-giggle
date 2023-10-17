import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/task.dart';
import 'package:app/services/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController assigneeController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: taskNameController,
              decoration: const InputDecoration(labelText: "Task Name"),
            ),
            TextField(
              controller: assigneeController,
              decoration: const InputDecoration(labelText: "Assignee"),
            ),
            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  taskNameController.text,
                  assigneeController.text,
                  DateTime.now(),
                );

                // Use the TaskProvider to add the new task
                Provider.of<TaskProvider>(context, listen: false)
                    .addTask(newTask);

                Navigator.pop(context);
              },
              child: const Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}
