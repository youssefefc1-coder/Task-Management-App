import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTxtField extends StatefulWidget {
  const AuthTxtField({
    super.key,
    required this.hintText,
    this.validator,
    required this.isPassword,
    required this.controller,
    required this.prefixIcon,
  });
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final String? Function(String?)? validator;
  final Icon prefixIcon;

  @override
  State<AuthTxtField> createState() => _AuthTxtFieldState();
}

class _AuthTxtFieldState extends State<AuthTxtField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      controller: widget.controller,
      obscureText: widget.isPassword && showPassword,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
          fontSize: 16.sp,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Theme.of(
              context,
            ).inputDecorationTheme.border!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Theme.of(
              context,
            ).inputDecorationTheme.enabledBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Theme.of(
              context,
            ).inputDecorationTheme.focusedBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Theme.of(
              context,
            ).inputDecorationTheme.errorBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.w,
            color: Theme.of(
              context,
            ).inputDecorationTheme.focusedErrorBorder!.borderSide.color,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
