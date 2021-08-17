import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/screens/account.created/account_created_screen.dart';
import 'package:momentum_test/screens/register/user_model.dart';
import 'package:momentum_test/utils/session_manager.dart';

class OTPValidationController extends GetxController {
  List<String> otp = List.filled(4, "");
  final UserModel userModel;

  OTPValidationController(this.userModel);

  void onBackClick() {
    Get.back();
  }

  void onSubmitClick(BuildContext context) {
    print('otp : $otp');
    if (otp[0].isNotEmpty &&
        otp[1].isNotEmpty &&
        otp[2].isNotEmpty &&
        otp[3].isNotEmpty) {
      SessionManager manager = SessionManager();
      manager.addUserDetails(userModel);
      Get.to(AccountCreatedScreen());
    } else {
      showInputOtp(context);
    }
  }

  showInputOtp(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("OTP"),
      content: Text("Please input otp"),
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

  void onResendClick() {}
}
