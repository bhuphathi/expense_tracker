import 'package:expense_tracker/screens/helper_widgets/expenses_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expense,
    required this.removeExpense,
  });

  final List<Expense> expense;
  final void Function(Expense) removeExpense;

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          removeExpense(expense[index]);
        },
        key: ValueKey(expense[index]),
        child: ExpensesItem(expense: expense[index]),
      ),
    );
  }
}
