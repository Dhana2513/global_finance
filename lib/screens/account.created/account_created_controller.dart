import 'package:get/get.dart';
import 'package:momentum_test/screens/landing/views/landing_screen.dart';

class AccountCreatedController extends GetxController {
  void onBackClick() {
    Get.back();
  }

  void onContinueClick() {
    Get.to(LandingScreen());
  }
}
