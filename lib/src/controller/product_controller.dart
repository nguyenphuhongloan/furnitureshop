import 'dart:async';

import 'package:get/get.dart';
import 'package:shop/src/data/repository/auth_repository.dart';
import 'package:shop/src/models/product.dart';

class ProductController extends GetxController {
  List<Product> listProduct = [];
  StreamController<List<Product>> _productStreamController =
      new StreamController<List<Product>>.broadcast(sync: true);
  Stream<List<Product>> get getStreamProduct => _productStreamController.stream;
  List<Product> get getListProduct => listProduct;
  Future<bool> initialController() async {
    listProduct = await AuthRepository().getAllProduct();
    _productStreamController.add(listProduct);
    return true;
  }
}
