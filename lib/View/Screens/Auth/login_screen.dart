import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/View/Widgets/auth_txt_form_field.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  String? authError;

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      final error = await AuthServices().login(
        emailController.text,
        passwordController.text,
      );

      if (error != null) {
        setState(() {
          authError = error;
        });
      } else {
        if (mounted) {
          context.read<TaskProvider>().listenToTasks(
            FirebaseAuth.instance.currentUser!.uid,
          );
          Navigator.pushReplacementNamed(context, "/home");
        }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 55.h,
                          width: 55.w,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                color: Color(
                                  0xff000000,
                                ).withValues(alpha: 0.05),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.check_circle_outline_outlined,
                            size: 33.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),

                        SizedBox(height: 16.h),
                        Text(
                          "TaskFlow",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Simplify your productivity",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 65.h),
                  Text(
                    "EMAIL ADDRESS",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AuthTxtField(
                    controller: emailController,
                    hintText: "name@example.com",
                    isPassword: false,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      } else if (value.contains("@") == false) {
                        return "Enter a valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "PASSWORD",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AuthTxtField(
                    controller: passwordController,
                    hintText: "********",
                    isPassword: true,
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 8) {
                        return "Password must be at least 8 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/resetPassword");
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: () => login(),
                    child: Container(
                      width: double.infinity,
                      height: 58.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward,
                            size: 22.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  authError != null
                      ? Column(
                          children: [
                            SizedBox(height: 10.h),
                            Text(
                              authError!,
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.h,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.2),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          "OR CONTINUE WITH",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.2),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.h,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () async {
                      final error = await AuthServices().signinWithGoogle();
                      if (error != null) {
                        setState(() {
                          authError = error;
                        });
                      } else {
                        if (mounted) {
                          context.read<TaskProvider>().listenToTasks(
                            FirebaseAuth.instance.currentUser!.uid,
                          );
                          Navigator.pushReplacementNamed(context, "/main");
                        }
                      }
                    },
                    child: Container(
                      width: 345.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.05),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            height: 24.h,
                            width: 24.w,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
