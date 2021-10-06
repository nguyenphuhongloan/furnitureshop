import 'dart:convert';

import 'package:http/http.dart';
import 'package:shop/constants/api_gateway.dart';
import 'package:shop/data/local/user_local.dart';
import 'package:shop/data/repository/base_repository.dart';
import 'package:shop/models/user_model.dart';
import 'package:shop/providers/user_provider.dart';

class AuthRepository {
  Future<bool> login({
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
      return true;
    }

    return false;
  }
}
