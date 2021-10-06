import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shop/app.dart';
import 'package:shop/providers/user_provider.dart';
import 'constants/colors.dart';

void main() async {
  await GetStorage.init();
  final previousCheck = Provider.debugCheckInvalidValueType;
  Provider.debugCheckInvalidValueType = <T>(T value) {
    if (value is UserProvider) return;
  };
  runApp(MultiProvider(
    providers: [
      Provider<UserProvider>(
        create: (_) => userProvider,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Furniture shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: primaryColor,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
