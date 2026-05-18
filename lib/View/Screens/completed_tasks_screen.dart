import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/View/Widgets/custom_list_tile.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tasks = context
        .watch<TaskProvider>()
        .tasks
        .where((element) => element.isDone == true)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 65.h,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 25),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        title: Text(
          S.of(context).completed_tasks,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.w,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          ),
        ),
      ),

      body: tasks.isEmpty
          ? Center(
              child: Text(
                S.of(context).no_completed_tasks,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    bottom: 5,
                    left: 24,
                    right: 24,
                  ),
                  child: CustomListTile(task: tasks[index]),
                );
              },
            ),
    );
  }
}
