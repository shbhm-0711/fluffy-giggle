import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/services/task_provider.dart';

void main() => runApp(const TaskListApp());

class TaskListApp extends StatelessWidget {
  const TaskListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const MaterialApp(
          home: MainScreen(),
        ));
  }
}
