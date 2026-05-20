import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/Services/Database/user_services.dart';
import 'package:task_management_app/View/Widgets/auth_txt_form_field.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

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
  bool googleLoading = false;
  bool logInLoading = false;

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        logInLoading = true;
      });
      final error = await AuthServices().login(
        emailController.text,
        passwordController.text,
      );

      if (error != null) {
        setState(() {
          logInLoading = false;
          authError = error;
        });
      } else {
        if (mounted) {
          setState(() {
            logInLoading = false;
          });
          context.read<TaskProvider>().listenToTasks(
            FirebaseAuth.instance.currentUser!.uid,
          );
          await context.read<UserDataProvider>().getUser(
            FirebaseAuth.instance.currentUser!.uid,
          );

          Navigator.pushReplacementNamed(context, "/main");
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
                  SizedBox(height: 60.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
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
                          "Tasky",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          S.of(context).login_phase,
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
                  SizedBox(height: 45.h),
                  Text(
                    S.of(context).email_address,
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
                        return S.of(context).field_cant_be_empty;
                      } else if (value.contains("@") == false) {
                        return S.of(context).enter_valid_email;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    S.of(context).password,
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
                        return S.of(context).field_cant_be_empty;
                      } else if (value.length < 6) {
                        return S.of(context).password_too_short;
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
                        S.of(context).forgot_password,
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
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: logInLoading
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
                                  S.of(context).login,
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
                                  size: 22.sp,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
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
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Text(
                          S.of(context).or_continue_with,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.4),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1.w,
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
                        context.read<UserDataProvider>().getUser(uid);
                        context.read<TaskProvider>().listenToTasks(uid);
                        Navigator.pushReplacementNamed(context, "/main");
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
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
                                    fontWeight: FontWeight.w600,
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
                        S.of(context).dont_have_account,
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
                          S.of(context).signup,
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
