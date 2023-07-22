import 'package:expense_tracker/screens/helper_widgets/expenses_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expense,
  });

  final List<Expense> expense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => ExpensesItem(expense: expense[index]),
    );
  }
}
