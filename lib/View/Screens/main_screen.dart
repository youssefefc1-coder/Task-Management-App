import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Extensions/category_extension.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/View/Widgets/custom_list_tile.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<UserDataProvider>().getUser(
        FirebaseAuth.instance.currentUser!.uid,
      ),
    );
  }

  String getGreeting() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return S.of(context).good_morning;
    } else if (hour < 17) {
      return S.of(context).good_afternoon;
    } else if (hour < 21) {
      return S.of(context).good_evening;
    } else {
      return S.of(context).good_night;
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? user = context.watch<UserDataProvider>().user;
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        taskProvider.filteredTasks.sort(
          (a, b) => b.priority.index.compareTo(a.priority.index),
        );
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getGreeting(),
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.6),
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "${S.of(context).hello}, ${user?.name ?? ''}!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                icon: Icon(Icons.settings, size: 28.sp),
              ),
              SizedBox(width: 20.w),
            ],
          ),

          body: Padding(
            padding: const EdgeInsets.all(24),
            child: taskProvider.tasks.isEmpty
                ? Center(
                    child: Text(
                      S.of(context).no_tasks,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.6),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/completed_tasks',
                            ),
                            child: Container(
                              height: 85.h,
                              width: 102.w,
                              padding: EdgeInsetsDirectional.only(
                                top: 20,
                                start: 20,
                                end: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).done,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.7),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    taskProvider.tasks
                                        .where(
                                          (element) => element.isDone == true,
                                        )
                                        .length
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/uncompleted_tasks',
                            ),
                            child: Container(
                              height: 85.h,
                              width: 102.w,
                              padding: EdgeInsetsDirectional.only(
                                top: 20,
                                start: 20,
                                end: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.1),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).pending,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.7),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    taskProvider.tasks
                                        .where(
                                          (element) => element.isDone == false,
                                        )
                                        .length
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            height: 85.h,
                            width: 102.w,
                            padding: EdgeInsetsDirectional.only(
                              top: 20,
                              start: 20,
                              end: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).total,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withValues(alpha: 0.7),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  taskProvider.tasks.length.toString(),
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 26.h),
                      Align(
                        alignment: isRTL
                            ? AlignmentGeometry.centerRight
                            : AlignmentGeometry.centerLeft,
                        child: Text(
                          S.of(context).your_tasks,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: SizedBox(
                          height: 40.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10.w),
                            itemCount: Category.values.length + 1,
                            itemBuilder: (context, index) {
                              final selectedCategories =
                                  taskProvider.selectedCategory;
                              if (index == 0) {
                                final isSelected = selectedCategories.isEmpty;
                                return FilterChip(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      24.r,
                                    ),
                                    side: BorderSide(
                                      width: 2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  selected: isSelected,
                                  showCheckmark: false,
                                  onSelected: (_) {
                                    taskProvider.clearAllCategories();
                                  },
                                  label: Text(
                                    S.of(context).all,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.secondary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                    ),
                                  ),
                                );
                              }

                              final category = Category.values[index - 1];
                              final isSelected = selectedCategories.contains(
                                category,
                              );

                              return FilterChip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    24.r,
                                  ),
                                  side: BorderSide(
                                    width: 2.w,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ),
                                selected: isSelected,
                                showCheckmark: false,
                                onSelected: (_) {
                                  taskProvider.toggleCategory(category);
                                },
                                label: Text(
                                  category.localizedName(context),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.secondary
                                        : Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: taskProvider.filteredTasks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 5),
                            child: CustomListTile(
                              task: taskProvider.filteredTasks[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
          ),

          floatingActionButton: Container(
            height: 70.h,
            width: 70.w,
            margin: EdgeInsets.only(bottom: 35),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/add_task');
              },
              shape: const CircleBorder(),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.secondary,
                size: 38.sp,
              ),
            ),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
