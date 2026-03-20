import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTxtFormField extends StatefulWidget {
  const AuthTxtFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
    this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<AuthTxtFormField> createState() => _AuthTxtFormFieldState();
}

class _AuthTxtFormFieldState extends State<AuthTxtFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.isPassword && !showPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    color: Colors.white,
                    showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 15),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.w),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.w),
          ),
          errorStyle: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
