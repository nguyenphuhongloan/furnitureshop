import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shop/src/models/cart_model.dart';
import 'package:shop/src/models/product.dart';

class CartController extends GetxController {
  List<CartModel> _listCart = [];
  StreamController<List<CartModel>> _cartStreamController =
      StreamController<List<CartModel>>.broadcast();

  Stream<List<CartModel>> get getStreamCart => _cartStreamController.stream;
  List<CartModel> get getListCart => _listCart;

  // Mark: - Event handle function

  void initialController() {
    _cartStreamController.add(_listCart);
  }

  void addToCart({required Product product}) {
    int index = _listCart.indexWhere((item) => item.product.id == product.id);
    if (index == -1) {
      CartModel cartModel = CartModel(product: product, quantity: 1);
      _listCart.add(cartModel);
    } else {
      _listCart[index].quantity++;
    }
    _cartStreamController.add(_listCart);
    update();
  }

  void deleteToCart({required String productId}) {
    int index = _listCart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _listCart.removeAt(index);
      _cartStreamController.add(_listCart);
    }
    update();
  }

  void deleteAllCart() {
    _listCart = [];
    _cartStreamController.add(_listCart);
  }

  void updateQuantity({required String productId, int quantity = 1}) {
    int index = _listCart.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      int newQuantity = _listCart[index].quantity + quantity;
      if (newQuantity >= 1 && newQuantity <= 10) {
        _listCart[index].quantity = newQuantity;
      }
      _cartStreamController.add(_listCart);
    }
    update();
  }

  int get productTotalPrice {
    int total = 0;
    for (var item in _listCart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  String get formattedProductTotalPrice {
    return NumberFormat.currency(
                locale: 'vi', customPattern: '#,###', decimalDigits: 0)
            .format(productTotalPrice) +
        "đ";
  }
}
