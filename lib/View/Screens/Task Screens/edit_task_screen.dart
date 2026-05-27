import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/notification_service.dart';
import 'package:task_management_app/View/Widgets/category_selector.dart';
import 'package:task_management_app/View/Widgets/priority_selector.dart';
import 'package:task_management_app/ViewModel/notification_provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key, required this.task});

  final TaskModel task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late Priority _selectedPriority;
  late Category _selectedCategory;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: selectedDate ?? DateTime.now(),
    );
    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    descriptionController = TextEditingController(
      text: widget.task.description ?? '',
    );
    selectedDate = widget.task.deadline;
    selectedTime = widget.task.deadline != null
        ? TimeOfDay.fromDateTime(widget.task.deadline!)
        : null;
    _selectedCategory = widget.task.category;
    _selectedPriority = widget.task.priority;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 65.h,
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 30),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary,
              size: 25.sp,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            width: 1.w,
          ),
        ),
        title: Text(
          S.of(context).edit_task,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).task_name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).task_name_empty_er;
                      }
                      return null;
                    },
                    maxLength: 20,
                    controller: titleController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    cursorColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.4),
                    decoration: InputDecoration(
                      counterText: '',
                      focusColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).inputDecorationTheme.border!.borderSide.color,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Theme.of(context)
                              .inputDecorationTheme
                              .focusedErrorBorder!
                              .borderSide
                              .color,
                        ),
                      ),
                      errorStyle: TextStyle(
                        color: Theme.of(
                          context,
                        ).inputDecorationTheme.errorStyle!.color,
                      ),
                      hintText: S.of(context).task_name_field_hint_text,
                      hintStyle: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.4),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    S.of(context).description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TextField(
                    maxLines: 5,
                    minLines: 4,
                    controller: descriptionController,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    cursorColor: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.4),
                    decoration: InputDecoration(
                      focusColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: BorderSide(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                        ),
                      ),
                      alignLabelWithHint: true,
                      hintText: S.of(context).description_field_hint_text,
                      hintStyle: TextStyle(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.4),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            S.of(context).due_date,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.8),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 120.w),
                          Text(
                            S.of(context).time,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.8),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _pickDate(context);
                              },
                              child: Container(
                                width: 150.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.4),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 15.w),
                                      Text(
                                        selectedDate != null
                                            ? "${selectedDate!.day}/${selectedDate!.month.toString().padLeft(2, '0')}/${selectedDate!.year}"
                                            : S.of(context).select_date,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                              end: 15,
                                            ),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          size: 24.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _pickTime(context);
                              },
                              child: Container(
                                width: 150.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: 0.4),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SizedBox(width: 15.w),
                                      Text(
                                        selectedTime != null
                                            ? selectedTime!.format(context)
                                            : S.of(context).select_time,
                                        style: TextStyle(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                              end: 15,
                                            ),
                                        child: Icon(
                                          Icons.watch_later_outlined,
                                          size: 24.sp,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    S.of(context).priority_level,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  PrioritySelector(
                    selectedPriority: _selectedPriority,
                    onChange: (value) {
                      setState(() {
                        _selectedPriority = value;
                      });
                    },
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    S.of(context).category,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CategorySelector(
                    selectedCategory: _selectedCategory,
                    onChange: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () async {
                      var task = Provider.of<TaskProvider>(
                        context,
                        listen: false,
                      );
                      if (_formkey.currentState!.validate()) {
                        DateTime? finalDeadline;
                        if (selectedDate != null && selectedTime != null) {
                          finalDeadline = DateTime(
                            selectedDate!.year,
                            selectedDate!.month,
                            selectedDate!.day,
                            selectedTime!.hour,
                            selectedTime!.minute,
                          );
                        }
                        try {
                          await task.updateTask(
                            FirebaseAuth.instance.currentUser!.uid,
                            widget.task.id!,
                            {
                              'title': titleController.text,
                              'description': descriptionController.text,
                              'deadline': finalDeadline,
                              'priority': _selectedPriority.name,
                              'category': _selectedCategory.name,
                            },
                          );

                          if (context.read<NotificationProvider>().isEnabled) {
                            if (!widget.task.isDone) {
                              await NotificationService.scheduleDeadlineAlert(
                                TaskModel(
                                  id: widget.task.id,
                                  title: titleController.text,
                                  deadline: finalDeadline,
                                  category: _selectedCategory,
                                  priority: _selectedPriority,
                                ),
                              );
                            } else {
                              await NotificationService.cancelTaskNotifications(
                                widget.task.id!,
                              );
                            }
                          }

                          Navigator.pop(context);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(S.of(context).task_update_fail_err),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 8,
                            spreadRadius: -3,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                          ),
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 6,
                            spreadRadius: -4,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).update_task,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
