import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatefulWidget {
  const AddExpenses({super.key, required this.addExpenseToDB});

  final void Function(Expense expense) addExpenseToDB;

  @override
  State<AddExpenses> createState() => _AddExpenses();
}

class _AddExpenses extends State<AddExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();
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

  void _submitExpense() {
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountNotValid = enteredAmount == null || enteredAmount <= 0;

    if (isAmountNotValid ||
        _selectedDate == null ||
        _titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title:
              const Text("Invalid Input!", style: TextStyle(color: Colors.red)),
          content: const Text("Invalid input please check!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Ok"),
            ),
          ],
        ),
      );
      return;
    }
    widget.addExpenseToDB(Expense(
        amount: enteredAmount,
        category: _selectedCategory,
        date: _selectedDate!,
        title: _titleController.text));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final double statusBarHeight =
        View.of(context).viewPadding.top / View.of(context).devicePixelRatio;
    // print("statusBarHeight: $statusBarHeight");
    // print("devicePixelRatio: ${View.of(context).devicePixelRatio}");

    return Padding(
      padding: EdgeInsets.fromLTRB(16, statusBarHeight, 16, 16),
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
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: _submitExpense,
              child: const Text("Save Changes"),
            ),
          ],
        )
      ]),
    );
  }
}
