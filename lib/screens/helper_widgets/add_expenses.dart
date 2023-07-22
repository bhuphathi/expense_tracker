import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpenses();
}

class _AddExpenses extends State<AddExpenses> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50,
          controller: _titleController,
          decoration: const InputDecoration(
            label: Text("Title"),
          ),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_titleController);
                },
                child: const Text("Save Changes"))
          ],
        )
      ]),
    );
  }
}
