import 'package:get_storage/get_storage.dart';

class CartLocal{
  final _getStorage = GetStorage();
  final storageKey = 'cart';
  String getCart() {
    return _getStorage.read(storageKey) ?? '';
  }

  void saveCart(String accessToken) {
    _getStorage.write(storageKey, accessToken);
  }

  void clearCart() {
    _getStorage.remove(storageKey);
  }
}