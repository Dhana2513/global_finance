import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/commons/app_banner_image.dart';
import 'package:momentum_test/commons/common_input_filed.dart';

import 'signin_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _signInController.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: _signInController.onBackClick,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: AppBannerImage(),
                ),
                CommonTextField(
                  controller: _signInController.phoneNoController,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: _signInController.phoneNumberValidator,
                ),
                SizedBox(
                  height: 32,
                ),
                CommonTextField(
                  controller: _signInController.passwordController,
                  obscureText: true,
                  hintText: 'Password',
                  textInputAction: TextInputAction.done,
                  validator: _signInController.passwordValidator,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Remember me',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 12, color: const Color(0x00FF363868)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 12, color: const Color(0x00FF363868)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _signInController.onSignInClick(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Sign In'),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do not have an account? ',
                        style: TextStyle(color: const Color(0x00FFA7A7A7)),
                      ),
                      InkWell(
                        onTap: _signInController.onSignUpClick,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4, right: 8, top: 8, bottom: 8),
                          child: Text(
                            'Sign up here',
                            style: TextStyle(
                              color: const Color(0x00FF363868),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
