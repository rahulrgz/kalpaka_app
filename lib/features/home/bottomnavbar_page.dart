import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpaka_app/core/theme/pallete.dart';
import 'package:kalpaka_app/features/document/document_screen.dart';
import 'package:kalpaka_app/features/staff/Screen/staff_page.dart';

import '../orders/order_screen.dart';
import 'home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const StaffScreen(),
    const DocumentScreen(),
    const OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Pallete.darkColor,
        unselectedItemColor: Pallete.shadowColor,
        backgroundColor: Pallete.whiteColor,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2_fill),
            label: 'Staff',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rectangle_stack),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}
