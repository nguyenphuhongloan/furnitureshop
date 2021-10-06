import 'package:flutter/material.dart';
import 'package:shop/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _myProfile;
  String? _token;

  UserModel? get myProfile => _myProfile;
  String? get myToken => _token;

  set setMyProfile(UserModel _myProfile) {
    this._myProfile = _myProfile;
    notifyListeners();
  }

  void setMyToken(String _myToken) {
    this._token = myToken;
    notifyListeners();
  }
}

UserProvider userProvider = UserProvider();
