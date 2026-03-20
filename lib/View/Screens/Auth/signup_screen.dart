import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/View/Widgets/auth_txt_form_field.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    S.of(context).signup,
                    style: TextStyle(
                      color: Color(0xff021526),
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    S.of(context).welcome_friend,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: double.infinity,
                    height: 580.h,
                    decoration: BoxDecoration(
                      color: Color(0xff021526),
                      borderRadius: BorderRadius.circular(35.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formkey,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h),

                                AuthTxtFormField(
                                  controller: nameController,
                                  hintText: S.of(context).name,
                                  isPassword: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).field_cant_be_empty;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(height: 25.h),

                                AuthTxtFormField(
                                  controller: emailController,
                                  hintText: "hello@example.com",
                                  isPassword: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).field_cant_be_empty;
                                    } else if (value.contains("@") == false) {
                                      return S.of(context).enter_valid_email;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),

                                SizedBox(height: 25.h),
                                AuthTxtFormField(
                                  controller: passwordController,
                                  hintText: S.of(context).password,
                                  isPassword: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return S.of(context).field_cant_be_empty;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),

                                SizedBox(height: 45.h),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.r),
                                  ),
                                  color: Colors.white,
                                  height: 50.h,
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    signup();
                                    if (authError != null) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          margin: EdgeInsetsDirectional.all(15),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15.r,
                                            ),
                                          ),
                                          content: Text(
                                            S.of(context).verify_msg,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    S.of(context).signup,
                                    style: TextStyle(
                                      color: Color(0xff021526),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
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
                                SizedBox(height: 35.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        S.of(context).or_signup,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 1,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.h),
                                MaterialButton(
                                  height: 50.h,
                                  minWidth: double.infinity,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      25.r,
                                    ),
                                  ),
                                  onPressed: () async {
                                    final error = await AuthServices()
                                        .signinWithGoogle();
                                    if (error != null) {
                                      setState(() {
                                        authError = error;
                                      });
                                    } else {
                                      if (mounted) {
                                        context
                                            .read<TaskProvider>()
                                            .listenToTasks(
                                              FirebaseAuth
                                                  .instance
                                                  .currentUser!
                                                  .uid,
                                            );
                                        Navigator.pushReplacementNamed(
                                          context,
                                          "/home",
                                        );
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/google.png',
                                        height: 25.h,
                                        width: 25.w,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(S.of(context).signup_with_google),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      S.of(context).have_account,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/login',
                                        );
                                      },
                                      child: Text(
                                        " ${S.of(context).login}",
                                        style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400,
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
