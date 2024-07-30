// lib/screens/home/expenses_screen.dart
import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Expenses',
          style: TextStyle(fontSize: 24, color: Colors.blue.shade900),
        ),
      ),
    );
  }
}
