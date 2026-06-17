import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void deleteExpense(int index) {
    _expenses.removeAt(index);
    notifyListeners();
  }
  
  void updateExpense(int index, Expense updatedExpense) {
    _expenses[index] = updatedExpense;
    notifyListeners();
  }
}