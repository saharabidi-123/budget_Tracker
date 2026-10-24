import 'package:flutter/material.dart';

enum ExpenseCategory {
  food('Food', Icons.restaurant),
  transport('Transport', Icons.directions_bus),
  shopping('Shopping', Icons.shopping_bag),
  bills('Bills', Icons.receipt_long),
  other('Other', Icons.category);

  const ExpenseCategory(this.label, this.icon);

  final String label;
  final IconData icon;
}