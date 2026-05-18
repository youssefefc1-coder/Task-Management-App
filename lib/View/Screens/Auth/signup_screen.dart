import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/Services/Database/user_services.dart';
import 'package:task_management_app/View/Widgets/auth_txt_form_field.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

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
  bool googleLoading = false;
  bool signUpLoading = false;
  Future<void> signup() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        signUpLoading = true;
      });
      final error = await AuthServices().signup(
        emailController.text,
        passwordController.text,
        context,
      );

      if (error != null) {
        setState(() {
          signUpLoading = false;
          authError = error;
        });
      } else {
        if (mounted) {
          setState(() {
            signUpLoading = false;
          });
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
                        "Tasky",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    S.of(context).create_account,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    S.of(context).signup_phase,
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
                        S.of(context).your_name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: S.of(context).enter_your_email,
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
                            return S.of(context).field_cant_be_empty;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        S.of(context).email_address,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      AuthTxtField(
                        hintText: S.of(context).enter_your_email,
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
                            return S.of(context).field_cant_be_empty;
                          } else if (val.contains("@") == false) {
                            return S.of(context).enter_valid_email;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        S.of(context).password,
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
                            return S.of(context).field_cant_be_empty;
                          } else if (val.length < 8) {
                            return S.of(context).password_too_short;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        S.of(context).confirme_password,
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
                            return S.of(context).field_cant_be_empty;
                          } else if (val != passwordController.text) {
                            return S.of(context).passwords_dont_match;
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
                      child: signUpLoading
                          ? Center(
                              child: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.w,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  S.of(context).signup,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
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
                          S.of(context).or_continue_with,
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
                      setState(() {
                        googleLoading = true;
                      });
                      if (error != null) {
                        setState(() {
                          googleLoading = false;
                          authError = error;
                        });
                      } else {
                        final uid = FirebaseAuth.instance.currentUser!.uid;

                        final exists = await UserServices().userExists(uid);

                        if (!exists) {
                          await UserServices().saveUser(
                            UserModel(
                              name:
                                  FirebaseAuth
                                      .instance
                                      .currentUser!
                                      .displayName ??
                                  'User',
                              email:
                                  FirebaseAuth.instance.currentUser!.email ??
                                  '',
                            ),
                            uid,
                          );
                        }
                        setState(() {
                          googleLoading = false;
                        });
                        context.read<TaskProvider>().listenToTasks(
                          FirebaseAuth.instance.currentUser!.uid,
                        );
                        Navigator.pushReplacementNamed(context, "/main");
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
                      child: googleLoading
                          ? Center(
                              child: SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.w,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/google.png",
                                  height: 24.h,
                                  width: 24.w,
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  S.of(context).google,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
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
