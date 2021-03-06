import 'dart:convert';
import 'package:http/http.dart';
import 'package:shop/src/constants/api_gateway.dart';
import 'package:shop/src/data/local/user_local.dart';
import 'package:shop/src/data/repository/base_repository.dart';
import 'package:shop/src/models/product.dart';
import 'package:shop/src/models/user_model.dart';
import 'package:shop/src/providers/user_provider.dart';

class AuthRepository {
  Future<int> login({
    required String email,
    required String password,
  }) async {
    var body = {
      "email": email,
      "password": password,
    };
    Response response = await BaseRepository().post(ApiGateway.login, body);
    if (response.statusCode == 200) {
      dynamic jsonRes = jsonDecode(response.body);
      String myToken = jsonRes['data']['token'];
      UserModel myProfile = UserModel.fromMap(jsonRes['data']['user']);
      userProvider.setMyToken(myToken);
      userProvider.setMyProfile = myProfile;
      UserLocal().saveAccessToken(myToken);
      return 200;
    }
    return response.statusCode;
  }

  Future<int> register({
    required String email,
    required String password,
  }) async {
    var body = {
      "email": email,
      "password": password,
    };
    Response response = await BaseRepository().post(ApiGateway.register, body);
    if (response.statusCode == 200) {
      dynamic jsonRes = jsonDecode(response.body);
      String myToken = jsonRes['data']['token'];
      UserModel myProfile = UserModel.fromMap(jsonRes['data']['user']);
      userProvider.setMyToken(myToken);
      userProvider.setMyProfile = myProfile;
      UserLocal().saveAccessToken(myToken);
      return 200;
    }
    if (response.statusCode == 300) {
      dynamic jsonRes = jsonDecode(response.body);
      String message = jsonRes['message'];
      if (message == "Email already exist!!") return -1;
    }
    return response.statusCode;
  }

  Future<UserModel?> getMyProfile() async {
    Response response = await BaseRepository().get(ApiGateway.myProfile);
    if (response.statusCode == 200) {
      dynamic jsonRes = jsonDecode(response.body);
      UserModel myProfile = UserModel.fromMap(jsonRes['data']);
      userProvider.setMyProfile = myProfile;
      return myProfile;
    }
    return null;
  }

  Future<List<Product>> getAllProduct() async {
    Response response = await BaseRepository().get(ApiGateway.product);
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      dynamic jsonRes = jsonDecode(response.body);
      for (var i = 0; i < jsonRes['data'].length; i++) {
        Product product = Product.fromMap(jsonRes['data'][i]);
        listProduct.add(product);
      }
    }
    return listProduct;
  }
}
