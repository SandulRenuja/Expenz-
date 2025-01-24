import 'package:expenz/constant/colors.dart';
import 'package:expenz/screens/addnew_screen.dart';
import 'package:expenz/screens/budget_screen.dart';
import 'package:expenz/screens/home_screen.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transaction_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

//Current page Index
int _currentIndexPage = 0;
// Screen List
  final List<Widget> pages = [
    HomeScreen(),
    TransactionScreen(),
    AddnewScreen(),
    BudgetScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentIndexPage,
        onTap: (index) { 
          setState(() {
            _currentIndexPage = index;
            print(_currentIndexPage);
          });
        },
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
            ),

            BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
              label: "",
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.rocket),
             label: "Budget",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
             label: "Profile",
            ),
        ],
      ),
      body: pages[_currentIndexPage],
    );
  }
}