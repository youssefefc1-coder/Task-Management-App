import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/View/Widgets/my_drawer.dart';
import 'package:task_management_app/View/Widgets/my_floating_action_button.dart';
import 'package:task_management_app/View/Widgets/my_list_tile.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, task, child) {
        return Scaffold(
          drawer: MyDrawer(),
          backgroundColor: Color(0xffFFFFFF),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 20),
            child: MyFloatingActionButton(),
          ),
          appBar: AppBar(
            title: Text(
              S.of(context).tasks,
              style: TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontSize: 25.sp,
              ),
            ),
            centerTitle: true,
            leadingWidth: 55.w,
            leading: Builder(
              builder: (context) {
                return Row(
                  children: [
                    SizedBox(width: 10.w),
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Color(0xffffffff),
                        size: 30.sp,
                      ),
                    ),
                  ],
                );
              },
            ),
            backgroundColor: Color(0xff021526),
            toolbarHeight: 75.h,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.r),
                bottomRight: Radius.circular(15.r),
              ),
            ),
            actions: [
              PopupMenuButton(
                color: Color(0xff021526),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffFFFFFF), width: 1.w),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                icon: Icon(
                  Icons.filter_list,
                  color: Color(0xffFFFFFF),
                  size: 30.sp,
                ),
                itemBuilder: (context) => <PopupMenuEntry<int>>[
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      S.of(context).all_tasks,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text(
                      S.of(context).completed,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text(
                      S.of(context).not_completed,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 1) {
                    task.setFilter("all");
                  } else if (value == 2) {
                    task.setFilter("done");
                  } else if (value == 3) {
                    task.setFilter("notDone");
                  }
                },
              ),
              SizedBox(width: 15.w),
            ],
          ),
          body: task.filteredTasks.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).no_tasks,
                    style: TextStyle(
                      color: Color.fromRGBO(2, 21, 38, 0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: task.filteredTasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.all(10.0),
                      child: MyListTile(taskModel: task.filteredTasks[index]),
                    );
                  },
                ),
        );
      },
    );
  }
}
