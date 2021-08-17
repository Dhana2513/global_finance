import 'package:get/get.dart';
import 'package:momentum_test/screens/register/register_screen.dart';
import 'package:momentum_test/screens/signin/signin_screen.dart';

class HomeController extends GetxController {
  void onSignInClick() {
    Get.to(SignInScreen());
  }

  void onOpenAccountClick() {
    Get.to(RegisterScreen());
  }
}
