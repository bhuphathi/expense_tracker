import 'package:flutter/material.dart';

import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/screens/helper_widgets/add_expenses.dart';
import 'package:expense_tracker/screens/helper_widgets/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 200,
      title: "Petrol",
      date: DateTime.now(),
      category: Category.fuel,
    ),
    Expense(
      amount: 400,
      title: "Hotel",
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void addExpenses() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const AddExpenses(),
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        actions: [
          IconButton(
            onPressed: addExpenses,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "The Expenses Widget...",
          ),
          Expanded(
            child: ExpensesList(expense: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
