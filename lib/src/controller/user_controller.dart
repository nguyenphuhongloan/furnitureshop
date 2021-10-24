import 'dart:async';

import 'package:get/get.dart';
import 'package:shop/src/data/repository/auth_repository.dart';
import 'package:shop/src/models/user_model.dart';

class UserController extends GetxController {
  UserModel user = AuthRepository().getMyProfile() as UserModel;
  StreamController<UserModel> _userController = StreamController.broadcast();
  Stream<UserModel> get getStreamUser => _userController.stream;
  initialController() {
    _userController.add(user);
  }
}
