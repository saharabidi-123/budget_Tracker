import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/expense.dart';

/// The only place that knows HOW data is saved.
/// Later you can swap this for SQLite or Firebase without touching the rest.
class ExpenseStorage {
  static const _key = 'expenses';

  Future<List<Expense>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];

    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((item) => Expense.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(List<Expense> expenses) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(expenses.map((e) => e.toJson()).toList());
    await prefs.setString(_key, raw);
  }
}