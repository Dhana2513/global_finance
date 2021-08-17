import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:momentum_test/screens/register/user_model.dart';
import 'package:momentum_test/utils/session_manager.dart';


class LandingController extends GetxController {
  String getUserName() {
    SessionManager manager = SessionManager();
    UserModel? userModel = manager.getUserDetails();
    if (userModel == null) {
      return '';
    }
    return userModel.firstName ?? '';
  }

  void onLogoutClick(BuildContext context) {
    SessionManager sessionManager = SessionManager();
    sessionManager.removeUserDetails();
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }
}


