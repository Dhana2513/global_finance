import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;


  const CommonTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
    this.onTap,
    this.keyboardType,
    this.textCapitalization,
    this.textInputAction,
    this.obscureText = false,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      maxLines: 1,
      validator: validator,
      readOnly: readOnly,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText,
      style: TextStyle(fontSize: 17),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
          ),
          gapPadding: 0,
        ),
        // filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.black45,
        ),
      ),
    );
  }
}
