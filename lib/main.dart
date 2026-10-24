import 'package:flutter/material.dart';

import 'controllers/expense_controller.dart';
import 'screens/home_screen.dart';
import 'services/expense_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create the controller and load saved expenses before the app starts.
  final controller = ExpenseController(ExpenseStorage());
  await controller.load();

  runApp(ExpenseApp(controller: controller));
}

class ExpenseApp extends StatelessWidget {
  const ExpenseApp({super.key, required this.controller});

  final ExpenseController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: HomeScreen(controller: controller),
    );
  }
}