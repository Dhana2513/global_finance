import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/commons/app_banner_image.dart';
import 'package:momentum_test/commons/common_input_filed.dart';

import 'register_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            children: [
              Form(
                key: _registerController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: _registerController.onBackClick,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    AppBannerImage(),
                    SizedBox(
                      height: 24,
                    ),
                    CommonTextField(
                      hintText: 'First Name',
                      textCapitalization: TextCapitalization.sentences,
                      controller: _registerController.firstNameController,
                      validator: _registerController.nameValidator,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Middle Name',
                      textCapitalization: TextCapitalization.sentences,
                      controller: _registerController.middleNameController,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Last Name',
                      textCapitalization: TextCapitalization.sentences,
                      controller: _registerController.lastNameController,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GetBuilder<RegisterController>(
                      init: _registerController,
                      builder: (RegisterController controller) {
                        return CommonTextField(
                          hintText: 'Date Of Birth',
                          readOnly: true,
                          controller: _registerController.dobController,
                          onTap: () {
                            print('onTab call');
                            _registerController.selectDate(context);
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Email Address',
                      controller: _registerController.emailController,
                      validator: _registerController.emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Password',
                      controller: _registerController.passwordController,
                      obscureText: true,
                      validator: _registerController.passwordValidator,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Confirm Password',
                      controller: _registerController.confirmPasswordController,
                      obscureText: true,
                      validator: _registerController.confirmPasswordValidator,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CommonTextField(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.number,
                      controller: _registerController.phoneNoController,
                      validator: _registerController.phoneValidator,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField<String>(
                      items: <String>['Male', 'Female', 'Other']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          gapPadding: 0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.2),
                          ),
                          gapPadding: 0,
                        ),
                        // filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        hintText: 'Gender',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      onChanged: _registerController.onGenderSelect,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _registerController.createAccount,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                  text:
                                      'By tapping "Create Account", You will accept all '),
                              TextSpan(
                                text: 'Terms & Conditions.',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0x00FF2E3165),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
