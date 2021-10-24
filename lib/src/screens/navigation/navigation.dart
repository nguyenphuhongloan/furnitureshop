import 'package:flutter/material.dart';
import 'package:shop/src/screens/home/homescreen.dart';
import 'package:shop/src/screens/profile/profile_screen.dart';
import 'package:shop/src/widgets/bottom_navigation_bar.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  void handlePressedBottomItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BotNavBar(
        handlePressed: handlePressedBottomItem,
        index: _currentIndex,
      ),
      body: _pages[_currentIndex],
    );
  }
}
