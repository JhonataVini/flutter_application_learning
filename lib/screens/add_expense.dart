import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() =>
      _AddExpenseScreenState();
}

String selectedCategory = "General";
final categories = [
  "General",
  "Food",
  "Transport",
  "Bills",
  "Entertainment",
  "Shopping",
];
DateTime selectedDate = DateTime.now();


class _AddExpenseScreenState
    extends State<AddExpenseScreen> {

  final titleController =
      TextEditingController();

  final amountController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),

        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Expense Name",
              )
            ),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            
            DropdownButton<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                final picked =
                    await showDatePicker(
                  context: context,
                  firstDate:
                      DateTime(2020),
                  lastDate:
                      DateTime(2100),
                  initialDate:
                      selectedDate,
                );

                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text(
                selectedDate
                    .toString()
                    .split(" ")[0],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final expense = Expense(
                title: titleController.text,
                amount: double.parse(
                         amountController.text,
                        ),
                category: selectedCategory,
                 date: selectedDate,
                );

                if(expense.title == " "|| 
                    expense.title.isEmpty || 
                    expense.amount <= 0 || 
                    expense.amount.isNaN) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter valid title and amount"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                context
                    .read<ExpenseProvider>()
                    .addExpense(expense);

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}