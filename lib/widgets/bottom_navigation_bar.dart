import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants/colors.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({ Key? key }) : super(key: key);

  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int _selectedIndex = 0;
  List<dynamic> menuItems = [
    {
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/icons/box.svg',
      'label': 'Delivery',
    },
    {
      'icon': 'assets/icons/chat.svg',
      'label': 'Messages',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      'label': 'Wallet',
    },
    {
      'icon': 'assets/icons/profile.svg',
      'label': 'Profile',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black87,
      elevation: 32,
      type: BottomNavigationBarType.shifting,
      selectedLabelStyle: TextStyle(
        height: 1.5,
        fontSize: 12,
      ),
      unselectedLabelStyle: TextStyle(
        height: 1.5,
        fontSize: 12,
      ),
      items: menuItems.map((e) => BottomNavigationBarItem(
        icon: SvgPicture.asset(e['icon']),
        label: e['label'],
         activeIcon: SvgPicture.asset(
          e['icon'],
          color: primaryColor,
        ),  
      )).toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: primaryColor,
      onTap: onTappedItem,
    );
  }

  void onTappedItem(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}