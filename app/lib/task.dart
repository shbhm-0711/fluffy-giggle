import 'package:flutter/material.dart';

class Task {
  final String taskName;
  final String assignee;
  final DateTime dueDate;

  Task(this.taskName, this.assignee, this.dueDate);
}

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onAddTask;

  TaskListScreen(this.tasks, this.onAddTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: TaskList(tasks),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTaskScreen((newTask) {
                          onAddTask(newTask);
                          Navigator.pop(context);
                        })),
              );
            },
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onAddTask;

  AddTaskScreen(this.onAddTask);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController assigneeController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

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
                  dueDateController as DateTime,
                );
                widget.onAddTask(newTask);
              },
              child: Text("Save Task"),
            ),
          ],
        ),
      ),
    );
  }
}

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
              "Assignee: ${tasks[index].assignee}\nDue Date: ${tasks[index].dueDate}"),
        );
      },
    );
  }
}
