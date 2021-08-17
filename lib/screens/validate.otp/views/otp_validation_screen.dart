import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momentum_test/screens/register/user_model.dart';

import 'otp_input_view.dart';
import '../otp_validation_controller.dart';

class OtpValidateScreen extends StatefulWidget {
  final UserModel userModel;

  OtpValidateScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  _OtpValidateScreenState createState() => _OtpValidateScreenState();
}

class _OtpValidateScreenState extends State<OtpValidateScreen> {
  late OTPValidationController _otpValidationController;

  @override
  void initState() {
    super.initState();
    _otpValidationController =
        Get.put(OTPValidationController(widget.userModel));
  }

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
                  onTap: _otpValidationController.onBackClick,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 24),
                child: Center(
                    child: Image.asset(
                  'assets/images/call.png',
                  height: 150,
                )),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                alignment: Alignment.center,
                child: Text(
                  'Check Your Phone',
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                alignment: Alignment.center,
                child: Text(
                  'To confirm your account enter the 4 digit code send to ${_otpValidationController.userModel.phoneNumber}',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.only(top: 32),
                child: OtpInputView(_otpValidationController.otp),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _otpValidationController.onSubmitClick(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Submit',
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
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: _otpValidationController.onResendClick,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Resend Code',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey.shade200,
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
