import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/View/Widgets/my_modal_sheet.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class MyListTile extends StatelessWidget {
  final TaskModel taskModel;
  const MyListTile({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return ListTile(
      tileColor: Color(0xff021526),
      minTileHeight: 75.h,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      leading: CircleAvatar(
        radius: 30.r,
        backgroundColor: Colors.white,
        child: Image.asset(
          height: 25.h,
          width: 25.w,
          taskModel.isDone
              ? "assets/images/done.png"
              : "assets/images/cross.png",
          color: Colors.black,
        ),
      ),
      title: Text(
        taskModel.title,
        style: TextStyle(
          color: Color(0xffffffff),
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: PopupMenuButton(
        offset: Offset(isRTL ? 35 : -35, 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(isRTL ? 15 : 5),
            topLeft: Radius.circular(isRTL ? 5 : 15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          side: BorderSide(width: 2, color: Colors.white),
        ),
        color: Color(0xff021526),
        padding: EdgeInsetsDirectional.only(start: 12),
        icon: Icon(Icons.more_vert, color: Colors.white, size: 30.sp),
        onSelected: (value) {
          if (value == 1) {
            Navigator.pushNamed(context, '/task', arguments: taskModel);
          } else if (value == 2) {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return MyModalSheet(
                  sheetTitle: S.of(context).update_task,
                  buttonTitle: S.of(context).update,
                  isAdd: false,
                  taskModel: taskModel,
                );
              },
            );
          } else if (value == 3) {
            context.read<TaskProvider>().deleteTask(
              FirebaseAuth.instance.currentUser!.uid,
              taskModel.id!,
            );
          }
        },
        itemBuilder: (context) => <PopupMenuEntry<int>>[
          PopupMenuItem<int>(
            value: 1,
            child: Center(
              child: Text(
                S.of(context).open,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          PopupMenuDivider(height: 1),
          PopupMenuItem<int>(
            value: 2,
            child: Center(
              child: Text(
                S.of(context).update,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          PopupMenuDivider(height: 1),
          PopupMenuItem<int>(
            value: 3,
            child: Center(
              child: Text(
                S.of(context).delete,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
