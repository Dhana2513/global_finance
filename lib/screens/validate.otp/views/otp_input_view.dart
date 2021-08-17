import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputView extends StatefulWidget {
  final List<String> otp;

  const OtpInputView(this.otp, {Key? key}) : super(key: key);

  @override
  _OtpInputViewState createState() => _OtpInputViewState();
}

class _OtpInputViewState extends State<OtpInputView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _otpTextFieldBox(first: true, last: false, index: 0),
        _otpTextFieldBox(first: false, last: false, index: 1),
        _otpTextFieldBox(first: false, last: false, index: 2),
        _otpTextFieldBox(first: false, last: true, index: 3),
      ],
    );
  }

  _otpTextFieldBox({
    required bool first,
    required bool last,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width: 36,
        child: TextField(
          autofocus: true,
          onChanged: (String value) {
            widget.otp[index] = value ;
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Theme.of(context).accentColor),
              ),
              hintText: ''),
        ),
      ),
    );
  }
}
