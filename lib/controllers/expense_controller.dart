import 'package:flutter/foundation.dart';

import '../models/expense.dart';
import '../services/expense_storage.dart';

/// Holds the list of expenses and the logic around it.
/// Screens listen to it and rebuild when notifyListeners() is called.
class ExpenseController extends ChangeNotifier {
  ExpenseController(this._storage);

  final ExpenseStorage _storage;
  List<Expense> _expenses = [];

  List<Expense> get expenses => List.unmodifiable(_expenses);

  double get total => _expenses.fold<double>(0, (sum, e) => sum + e.amount);

  Future<void> load() async {
    _expenses = await _storage.load();
    _sortNewestFirst();
    notifyListeners();
  }

  Future<void> add(Expense expense) async {
    _expenses.add(expense);
    _sortNewestFirst();
    notifyListeners();
    await _storage.save(_expenses);
  }

  Future<void> remove(String id) async {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
    await _storage.save(_expenses);
  }

  void _sortNewestFirst() {
    _expenses.sort((a, b) => b.date.compareTo(a.date));
  }
}