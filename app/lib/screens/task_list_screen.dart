import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/widgets/task_list.dart';
import 'package:app/screens/add_task_screen.dart';
import 'package:app/services/task_provider.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Task List App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: TaskList(taskProvider.tasks),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(),
                ),
              );
            },
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }
}
