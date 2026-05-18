import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  Future<void> checkAuth() async {
    await Future.delayed(Duration(seconds: 2));

    User? user = FirebaseAuth.instance.currentUser;
    if (mounted) {
      if (user != null) {
        context.read<TaskProvider>().listenToTasks(user.uid);
        await context.read<UserDataProvider>().getUser(user.uid);
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 320.h),
            Image.asset(
              'assets/images/note.png',
              height: 100.h,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 25.h),
            Text(
              "Tasky",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              S.of(context).splash_phase,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.6),
              ),
            ),
            Spacer(),
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
