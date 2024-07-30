import 'package:flutter/material.dart';
import 'package:personal_finance_manager_using_flutter_firebase/screens/ExpensesScreen.dart';
import 'package:personal_finance_manager_using_flutter_firebase/screens/IncomeScreen.dart';
import 'package:personal_finance_manager_using_flutter_firebase/screens/ProfilePage.dart';
import 'package:personal_finance_manager_using_flutter_firebase/screens/StatisticsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    ExpensesScreen(),
    IncomeScreen(),
    StatisticsScreen(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAddExpense() {
    // Handle the add expense action here
    print("Add Expense Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('Personal Finance Manager'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddExpense,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue.shade900,
        shape: CircleBorder(),
        elevation: 6.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0, // Reduce notch margin
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildTabItem(index: 0, icon: Icons.home_sharp, label: 'Home'),
            buildTabItem(index: 1, icon: Icons.attach_money, label: 'Budget'),
            SizedBox(width: 48), // Ensure space for FloatingActionButton
            buildTabItem(index: 2, icon: Icons.bar_chart, label: 'Statistics'),
            buildTabItem(
                index: 3, icon: Icons.person_3_outlined, label: 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget buildTabItem(
      {required int index, required IconData icon, required String label}) {
    return Expanded(
      child: IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: _selectedIndex == index
                    ? Colors.blue.shade900
                    : Colors.grey),
            Text(label,
                style: TextStyle(
                    color: _selectedIndex == index
                        ? Colors.blue.shade900
                        : Colors.grey)),
          ],
        ),
        onPressed: () => _onItemTapped(index),
      ),
    );
  }
}
