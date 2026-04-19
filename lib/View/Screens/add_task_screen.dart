import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final GlobalKey<FormState> _formkey = .new();

  final TextEditingController titleController = .new();
  final TextEditingController descriptionController = .new();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 65.h,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
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
          "New Task",
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
                    "TASK NAME",
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
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter task Name";
                      } else {
                        return null;
                      }
                    },
                    maxLength: 15,
                    controller: titleController,
                    style: TextStyle(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
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
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                      hintText: "What needs to be done?",
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
                    "DESCRIPTION",
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
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.4),
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
                      hintText: "Add more details about the task...",
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
                            "DUE DATE",
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
                            "TIME",
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
                                            : "select date",
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
                                            : "select time",
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
                    "PRIORITY LEVEL",
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
            ),
          ),
        ),
      ),
    );
  }
}
