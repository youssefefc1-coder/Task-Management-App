import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/View/Screens/Task%20Screens/display_tasks_screen.dart';
import 'package:task_management_app/View/Widgets/category_filter_chip.dart';
import 'package:task_management_app/View/Widgets/custom_list_tile.dart';
import 'package:task_management_app/View/Widgets/stat_card.dart';
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
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  "${S.of(context).hello} ${user?.name ?? ''}!",
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
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
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
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DisplayTasksScreen(isCompleted: true),
                                ),
                              ),
                              child: StatCard(
                                label: S.of(context).done,
                                value: taskProvider.tasks
                                    .where((element) => element.isDone == true)
                                    .length
                                    .toString(),
                                isTotal: false,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),

                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      DisplayTasksScreen(isCompleted: false),
                                ),
                              ),

                              child: StatCard(
                                label: S.of(context).pending,
                                value: taskProvider.tasks
                                    .where((element) => element.isDone == false)
                                    .length
                                    .toString(),
                                isTotal: false,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: StatCard(
                              label: S.of(context).total,
                              value: taskProvider.tasks.length.toString(),
                              isTotal: true,
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
                      SizedBox(height: 14.h),
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: SizedBox(
                          height: 42.h,
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
                                return CustomFilterChip(
                                  isFirstIndex: true,
                                  category: null,
                                  onSelect: () {
                                    taskProvider.clearAllCategories();
                                  },
                                  isSelected: isSelected,
                                );
                              }

                              final category = Category.values[index - 1];
                              final isSelected = selectedCategories.contains(
                                category,
                              );

                              return CustomFilterChip(
                                category: category,
                                onSelect: () {
                                  taskProvider.toggleCategory(category);
                                },
                                isSelected: isSelected,
                                isFirstIndex: false,
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: taskProvider.filteredTasks.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 12.h, bottom: 5.h),
                              child: CustomListTile(
                                task: taskProvider.filteredTasks[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),

          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child: CircleAvatar(
              radius: 32.r,
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
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
