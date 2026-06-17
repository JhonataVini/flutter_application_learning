import 'package:flutter/material.dart';
import '../models/expense.dart';

class EditExpenseScreen extends StatefulWidget {

  final Expense expense;

  const EditExpenseScreen({
    super.key,
    required this.expense,
  });

  @override
  State<EditExpenseScreen> createState() =>
      _EditExpenseScreenState();
}

class _EditExpenseScreenState
    extends State<EditExpenseScreen> {

  late TextEditingController titleController;
  late TextEditingController amountController;

  @override
  void initState() {
    super.initState();

    titleController =
        TextEditingController(
      text: widget.expense.title,
    );

    amountController =
        TextEditingController(
      text:
          widget.expense.amount.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Expense"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: titleController,
            ),

            TextField(
              controller: amountController,
              keyboardType:
                  TextInputType.number,
            ),

            ElevatedButton(
              onPressed: () {

                Navigator.pop(
                  context,
                  {
                    "title":
                        titleController.text,
                    "amount":
                        double.parse(
                      amountController.text,
                    ),
                  },
                );

              },
              child:
                  const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}