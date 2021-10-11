import 'package:get/get.dart';
import 'package:shop/app.dart';
import 'package:shop/src/screens/Cart/cart_screen.dart';
import 'package:shop/src/screens/category/category_screen.dart';
import 'package:shop/src/screens/login_and_register/login_screen.dart';
import 'package:shop/src/screens/login_and_register/register_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;
  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => App(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.CART,
      page: () => CartScreen()
    ),
    GetPage(name: Routes.CATEGORY, page: () => CategoryScreen())
  ];
}