import 'package:flutter/material.dart';

import '../controllers/expense_controller.dart';
import '../widgets/add_expense_sheet.dart';
import '../widgets/expense_tile.dart';
import '../widgets/total_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.controller});

  final ExpenseController controller;

  void _openAddSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => AddExpenseSheet(onAdd: controller.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openAddSheet(context),
        child: const Icon(Icons.add),
      ),
      // Rebuilds this part every time the controller changes.
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          final expenses = controller.expenses;

          return Column(
            children: [
              TotalCard(total: controller.total),
              Expanded(
                child: expenses.isEmpty
                    ? const Center(
                        child: Text('No expenses yet. Tap + to add one.'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 88),
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final expense = expenses[index];
                          return ExpenseTile(
                            expense: expense,
                            onDelete: () => controller.remove(expense.id),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}