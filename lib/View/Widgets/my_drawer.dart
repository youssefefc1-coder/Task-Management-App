import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Services/Authentication/auth_services.dart';
import 'package:task_management_app/View/Widgets/language_alert_dialog.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffFFFFFF),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250.h,
            color: Color(0xff021526),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 35.h),
                  CircleAvatar(
                    radius: 60.r,
                    backgroundColor: Color(0xffFFFFFF),
                    child: Image.asset(
                      "assets/images/note.png",
                      height: 95.h,
                      width: 95.w,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    S.of(context).settings,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          ListTile(
            tileColor: Color(0xffFFFFFF),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LangAlertDialog();
                },
              );
            },
            leading: Icon(Icons.language, color: Color(0xff021526)),
            title: Text(
              S.of(context).app_language,
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xff021526),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListTile(
            tileColor: Color(0xffFFFFFF),
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.r),
                    ),
                    title: Text(
                      S.of(context).are_you_sure,
                      style: TextStyle(color: Color(0xff021526)),
                    ),
                    content: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            S.of(context).cancel,
                            style: TextStyle(color: Color(0xff021526)),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            context.read<TaskProvider>().stopListening();
                            await AuthServices().signout();
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            S.of(context).logout,
                            style: TextStyle(color: Color(0xff021526)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            leading: Icon(Icons.logout_outlined, color: Color(0xff021526)),
            title: Text(
              S.of(context).logout,
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xff021526),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
