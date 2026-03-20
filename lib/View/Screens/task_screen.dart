import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/generated/l10n.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        leadingWidth: 60.w,
        toolbarHeight: 75.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.r),
            bottomRight: Radius.circular(15.r),
          ),
        ),
        backgroundColor: Color(0xff021526),
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              isRTL
                  ? "assets/images/back_right.png"
                  : "assets/images/back_left.png",
              color: Color(0xffffffff),
              width: 35.w,
              height: 35.h,
            ),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Center(
            child: CircleAvatar(
              backgroundColor: Color(0xff021526),
              radius: 80.r,
              child: Image.asset(
                task.isDone
                    ? "assets/images/done.png"
                    : "assets/images/cross.png",
                height: 60.h,
                width: 60.w,
                color: Color(0xffffffff),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          task.deadline != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: Text(
                    "${S.of(context).deadline}: ${task.deadline!.day}/${task.deadline!.month}/${task.deadline!.year}",
                    style: TextStyle(
                      color: Color(0xff021526),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : SizedBox(),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsetsDirectional.all(10),
            child: Text(
              task.description ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff021526),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
