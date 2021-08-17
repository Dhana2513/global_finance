import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/screens/landing/views/landing_screen.dart';
import 'package:momentum_test/screens/register/register_screen.dart';
import 'package:momentum_test/screens/register/user_model.dart';
import 'package:momentum_test/screens/validate.otp/views/otp_validation_screen.dart';
import 'package:momentum_test/utils/session_manager.dart';

class SignInController extends GetxController {
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onBackClick() {
    Get.back();
  }

  void onSignUpClick() {
    Get.to(RegisterScreen());
  }

  String? phoneNumberValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Phone Number';
    }
    return null;
  }

  String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please Enter Password';
    }
    return null;
  }

  void onSignInClick(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (_validateUser()) {
        Get.to(LandingScreen());
      } else {
        showInvalidUserAlert(context);
      }
    }
  }

  _validateUser() {
    SessionManager sessionManager = SessionManager();
    UserModel? userModel = sessionManager.getUserDetails();
    String phoneNo = phoneNoController.text.trim();
    String password = passwordController.text.trim();

    print('userModel $userModel');
    if (userModel != null) {
      if (userModel.phoneNumber == phoneNo && userModel.password == password) {
        return true;
      }
    }
    return false;
  }

  showInvalidUserAlert(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Invalid User"),
      content: Text("Please check your phone no & password."),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
