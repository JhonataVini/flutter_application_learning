import 'package:flutter/material.dart';
import 'package:flutter_application_learning/models/expense.dart';
import 'package:flutter_application_learning/screens/edit_expsense.dart';
import 'package:provider/provider.dart';
import 'add_expense.dart';
import '../providers/expense_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final expenses =
        context.watch<ExpenseProvider>().expenses;

    double totalExpenses = expenses.fold(0, (sum, expense) => sum + expense.amount,
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: Column(
  children: [

    Card(
      margin: const EdgeInsets.all(16),
      child: ListTile(
        title: const Text(
          "Total Expenses",
        ),
        subtitle: Text(
          "€$totalExpenses",
        ),
      ),
    ),

    Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {

          final expense =
              expenses[index];

            return ListTile(
              title: Text(expense.title),
              subtitle: Text(expense.category),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text("€${expense.amount}"),

                  IconButton(
                      icon: const Icon(Icons.edit),

                      onPressed: () async {

                        final result =
                            await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                EditExpenseScreen(
                              expense: expense,
                            ),
                          ),
                        );

                        if (result != null) {

                          final updatedExpense =
                              Expense(
                                title: result["title"],
                                amount: result["amount"],
                                category: expense.category,
                                date: expense.date,
                                );

                          // ignore: use_build_context_synchronously
                          context
                              .read<ExpenseProvider>()
                              .updateExpense(
                                index,
                                updatedExpense,
                              );
                        }
                      },
                    ),

                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {

                      context
                          .read<ExpenseProvider>()
                          .deleteExpense(index);
                    },
                  ),
                ],
              ),
            );
        },
      ),
    ),
  ],
),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AddExpenseScreen(),
        ),
      );
    },
    child: const Icon(Icons.add),
  ),
    );
  }
}
