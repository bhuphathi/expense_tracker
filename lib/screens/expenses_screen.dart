import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/screens/helper_widgets/add_expenses.dart';
import 'package:expense_tracker/screens/helper_widgets/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen(
      {super.key, required this.toggleTheme, required this.themeMode});

  final void Function() toggleTheme;
  final CurrentThemeMode themeMode;

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
    void expense(Expense exp) {
      setState(() {
        _registeredExpenses.add(exp);
      });
    }

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpenses(addExpenseToDB: expense),
    );
  }

  void removeExpense(Expense expense) {
    // final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${expense.title}, Expense deleted..."),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                // _registeredExpenses.insert(expenseIndex, expense);
                _registeredExpenses.add(expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text("No expenses found, start adding some..."),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expense: _registeredExpenses,
        removeExpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense tracker"),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: IconButton(
              onPressed: addExpenses,
              icon: const Icon(Icons.add),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: widget.toggleTheme,
              icon: widget.themeMode == CurrentThemeMode.dark
                  ? const Icon(Icons.wb_sunny_outlined)
                  : const Icon(Icons.nights_stay_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "The Expenses Widget...",
          ),
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
