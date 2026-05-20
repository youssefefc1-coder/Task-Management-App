import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/View/Widgets/custom_bottom_sheet.dart';
import 'package:task_management_app/View/Widgets/language_alert_dialog.dart';
import 'package:task_management_app/View/Widgets/theme_alert_dialog.dart';
import 'package:task_management_app/ViewModel/locale_provider.dart';
import 'package:task_management_app/ViewModel/notification_provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/ViewModel/theme_provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserDataProvider>().user;
    final locale = context.watch<LocaleProvider>().locale;
    final theme = context.watch<ThemeProvider>().themeMode;

    String currentLocale() {
      switch (locale?.languageCode) {
        case 'en':
          return S.of(context).english;
        case 'ar':
          return S.of(context).arabic;
        default:
          return S.of(context).system;
      }
    }

    String currentTheme() {
      switch (theme) {
        case ThemeMode.light:
          return S.of(context).light;
        case ThemeMode.dark:
          return S.of(context).dark;
        case ThemeMode.system:
          return S.of(context).system;
      }
    }

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
          S.of(context).settings,
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
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).account,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h),
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
                padding: EdgeInsetsDirectional.only(start: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          user?.name ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return CustomModalBottomSheet(
                              name: user?.name ?? '',
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(width: 14.w),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8.h),
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
                padding: EdgeInsetsDirectional.only(start: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 25.sp,
                    ),
                    SizedBox(width: 15.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).email,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          user?.email ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              S.of(context).general,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 12.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return LangAlertDialog();
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
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
                  padding: const EdgeInsetsDirectional.only(start: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.language_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 25.sp,
                      ),
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).language,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            currentLocale(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ThemeAlertDialog(),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
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
                  padding: const EdgeInsetsDirectional.only(start: 14),
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
                      SizedBox(width: 15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).appearance,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            currentTheme(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.h),
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
                  padding: const EdgeInsetsDirectional.only(start: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.notifications_active_outlined,
                        color: Theme.of(context).colorScheme.primary,
                        size: 25.sp,
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        S.of(context).notification,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        activeTrackColor: Theme.of(context).colorScheme.primary,
                        activeThumbColor: Theme.of(
                          context,
                        ).colorScheme.secondary,
                        value: context.watch<NotificationProvider>().isEnabled,
                        onChanged: (value) async {
                          final tasks = context.read<TaskProvider>().tasks;
                          if (value) {
                            await context
                                .read<NotificationProvider>()
                                .enableNotification(tasks);
                          } else {
                            await context
                                .read<NotificationProvider>()
                                .disableNotification();
                          }
                        },
                      ),
                      SizedBox(width: 15.w),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 24.h,
                        horizontal: 24.w,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 64.h,
                            width: 64.w,
                            decoration: BoxDecoration(
                              color: Color(0xffEF4444).withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.logout_outlined,
                              size: 23.sp,
                              color: Color(0xffEF4444),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            S.of(context).logout,
                            style: TextStyle(
                              color: Color(0xff0F172A),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              S.of(context).logout_message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff64748B),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          GestureDetector(
                            onTap: () async {
                              await AuthServices().signout();
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/login',
                                (route) => false,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Color(0xffEF4444),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 15,
                                    spreadRadius: -3,
                                    color: Color(
                                      0xffEF4444,
                                    ).withValues(alpha: 0.2),
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 6,
                                    spreadRadius: -4,
                                    color: Color(
                                      0xffEF4444,
                                    ).withValues(alpha: 0.2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).logout,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: double.infinity,
                              height: 55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                color: Color(0xffF1F5F9),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).cancel,
                                  style: TextStyle(
                                    color: Color(0xff334155),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              minWidth: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              color: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
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
                    S.of(context).logout,
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
