import 'package:flutter/material.dart';

import 'package:expense_tracker/screens/expenses_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ExpensesScreen(),
    ),
  );
}
