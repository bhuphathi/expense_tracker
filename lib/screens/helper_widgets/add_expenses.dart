import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpenses();
}

class _AddExpenses extends State<AddExpenses> {
  @override
  Widget build(context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Text("Test Enter Text"),
    );
  }
}
