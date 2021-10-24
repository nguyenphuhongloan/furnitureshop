import 'package:flutter/material.dart';

import 'package:shop/src/screens/navigation/navigation.dart';

import 'src/data/local/user_local.dart';
import 'src/screens/login_and_register/login_screen.dart';

class App extends StatefulWidget {
  @override
  createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return UserLocal().getAccessToken().length == 0
        ? LoginScreen()
        : Navigation();
  }
}
