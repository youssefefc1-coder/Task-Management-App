import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
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
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 250.h),
              Image.asset('assets/images/note.png', height: 100.h),
              SizedBox(height: 40.h),
              Text(
                "To-Do",
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff021526),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                S.of(context).splash_phase,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(2, 21, 38, 0.5),
                ),
              ),
              SizedBox(height: 185.h),
              CircularProgressIndicator(color: Color(0xff021526)),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
