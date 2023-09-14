import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Groceries',
        amount: 15.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'New phone',
        amount: 599.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'New desk',
        amount: 299.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'New desk chair',
        amount: 199.99,
        date: DateTime.now(),
        category: Category.work),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay),
          ],
        ),
        body: Column(
          children: [
            Text('The chart'),
            Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
            ),
          ],
        ));
  }
}
