import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
        borderOnForeground: true,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(expense.title),
            Row(
              children: [
                Text("Rs.${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ));
  }
}
