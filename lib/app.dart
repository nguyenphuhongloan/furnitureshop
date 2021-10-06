import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/local/user_local.dart';
import 'package:shop/providers/user_provider.dart';
import 'package:shop/screens/home/homescreen.dart';
import 'package:shop/screens/login_and_register/login_screen.dart';

class App extends StatefulWidget {
  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return UserLocal().getAccessToken().length == 0 ? LoginScreen() : HomeScreen();
  }
}
