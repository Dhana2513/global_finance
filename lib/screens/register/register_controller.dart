import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:momentum_test/screens/register/user_model.dart';
import 'package:momentum_test/screens/validate.otp/views/otp_validation_screen.dart';

class RegisterController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String gender = '';

  final formKey = GlobalKey<FormState>();

  String? confirmPasswordValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        passwordController.text.trim() != value.trim()) {
      return 'Password not match';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Please enter at least 6 characters';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter first name';
    }
    return null;
  }

  void onBackClick() {
    Get.back();
  }

  void createAccount() {
    if (formKey.currentState!.validate()) {
      UserModel userModel = UserModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        middleName: middleNameController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneNoController.text.trim(),
        dob: dobController.text.trim(),
        emailAddress: emailController.text.trim(),
        gender: gender,
      );

      Get.to(OtpValidateScreen(
        userModel: userModel,
      ));
    }
  }

  void onGenderSelect(String? value) {
    gender = value ?? '';
  }

  Future selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text = DateFormat('dd-MMM-yyyy').format(picked);
      update();
    }
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (value.length < 10) {
      return 'Invalid phone number';
    }
    return null;
  }
}
