import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key});

  @override
  State<AddExpenses> createState() => _AddExpenses();
}

class _AddExpenses extends State<AddExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  _datePicker() async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(now.year - 1, 4, 1),
        lastDate: now);
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            label: Text("Title"),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: "Rs.",
                  label: Text("Amount"),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate != null
                      ? dateFormat.format(_selectedDate!)
                      : "Date not selected!"),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name,
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(
              width: 16,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                print(_titleController);
                print(_amountController);
              },
              child: const Text("Save Changes"),
            ),
          ],
        )
      ]),
    );
  }
}
