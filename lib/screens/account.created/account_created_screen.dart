import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_created_controller.dart';

class AccountCreatedScreen extends StatelessWidget {
  AccountCreatedScreen({Key? key}) : super(key: key);
  final AccountCreatedController _accountCreatedController =
      Get.put(AccountCreatedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: _accountCreatedController.onBackClick,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                alignment: Alignment.center,
                child: Text(
                  'Account Created',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                alignment: Alignment.center,
                child: Text(
                  'Congratulation your account has been created.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                alignment: Alignment.center,
                child: Text(
                  'Please click on the "Continue" button to get into the app and start taking change of your finances',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _accountCreatedController.onContinueClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
            ],
          ),
        ),
      ),
    );
  }
}
