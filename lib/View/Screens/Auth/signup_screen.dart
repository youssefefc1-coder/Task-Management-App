import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/Services/Database/user_services.dart';
import 'package:task_management_app/View/Widgets/auth_txt_form_field.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePassController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  String? authError;

  Future<void> signup() async {
    if (_formkey.currentState!.validate()) {
      final error = await AuthServices().signup(
        emailController.text,
        passwordController.text,
      );

      if (error != null) {
        setState(() {
          authError = error;
        });
      } else {
        if (mounted) {
          await UserServices().saveUser(
            UserModel(name: nameController.text, email: emailController.text),
            FirebaseAuth.instance.currentUser!.uid,
          );
          Navigator.pushReplacementNamed(context, "/login");
        }
      }
    }
  }

  @override
  void dispose() {
    nameController.dispose();
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
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25.sp,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Icon(
                          Icons.check_circle_outline_rounded,
                          size: 25.sp,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        "TaskFlow",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Join TaskFlow and stay organized effortlessly.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: "Enter your name",
                        isPassword: false,
                        controller: nameController,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Field Can't be Empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: "Enter your email",
                        isPassword: false,
                        controller: emailController,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Field Can't be Empty";
                          } else if (val.contains("@") == false) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: "********",
                        isPassword: true,
                        controller: passwordController,
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Field Can't be Empty";
                          } else if (val.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: "********",
                        isPassword: true,
                        controller: confirmePassController,
                        prefixIcon: Icon(
                          Icons.shield_outlined,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "Field Can't be Empty";
                          } else if (val != passwordController.text) {
                            return "Password and Confirm Password doesn't match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () {
                      signup();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 22.sp,
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
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "OR SIGN UP WITH",
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.4),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
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
                          Navigator.pushReplacementNamed(context, "/home");
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
