import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:task_management_app/Extensions/priority_extension.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/notification_service.dart';
import 'package:task_management_app/View/Screens/Task%20Screens/edit_task_screen.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/task', arguments: task),
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: task.isDone
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.05)
              : Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: task.isDone
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 2,
              color: Color(0xff000000).withValues(alpha: 0.05),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20.w),

            GestureDetector(
              onTap: () {
                Provider.of<TaskProvider>(context, listen: false).updateTask(
                  FirebaseAuth.instance.currentUser!.uid,
                  task.id!,
                  {'isDone': !task.isDone},
                );
                NotificationService.cancelTaskNotifications(task.id!);
              },
              child: Container(
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  color: task.isDone
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3.w,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Center(
                  child: task.isDone
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 22.sp,
                          weight: 30,
                        )
                      : SizedBox(),
                ),
              ),
            ),

            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: task.isDone
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.8)
                          : Theme.of(context).colorScheme.primary,
                      decoration: task.isDone
                          ? TextDecoration.lineThrough
                          : null,
                      decorationColor: Theme.of(context).colorScheme.primary,
                      decorationThickness: 1.w,
                    ),
                  ),
                  task.deadline == null
                      ? SizedBox()
                      : Text(
                          DateFormat(
                            'h:mm MMM dd',
                          ).format(task.deadline!).toString(),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              height: 25.h,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.brightnessOf(context) == Brightness.light
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(
                        context,
                      ).colorScheme.onTertiary.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    task.priority.localizedName(context),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.brightnessOf(context) == Brightness.light
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.w),

            PopupMenuButton(
              color: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
              ),

              offset: isRTL ? Offset(30, 20) : Offset(-30, 20),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditTaskScreen(task: task),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).edit,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuDivider(
                    height: 1,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  PopupMenuItem(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            title: Text(
                              S.of(context).are_you_sure,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text(
                                  S.of(context).cancel,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                child: Text(
                                  S.of(context).delete,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<TaskProvider>(
                                    context,
                                    listen: false,
                                  ).deleteTask(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    task.id!,
                                  );
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Center(
                      child: Text(
                        S.of(context).delete,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ];
              },
            ),

            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
