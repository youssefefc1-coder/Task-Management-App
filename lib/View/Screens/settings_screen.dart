import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
            size: 25.sp,
          ),
        ),
        leadingWidth: 80.w,
        toolbarHeight: 65.h,
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "General",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                ),
                color: Theme.of(context).colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Color(0xff000000).withValues(alpha: 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          "name1234@gmail.com",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Language",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                ),
                color: Theme.of(context).colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Color(0xff000000).withValues(alpha: 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "app language: ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "English",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Appearance",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.2),
                ),
                color: Theme.of(context).colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Color(0xff000000).withValues(alpha: 0.05),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.dark_mode_outlined
                          : Icons.light_mode_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Theme: ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "System (Default)",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 25.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
