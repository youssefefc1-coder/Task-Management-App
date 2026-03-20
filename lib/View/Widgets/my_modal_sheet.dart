import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/noti_service.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class MyModalSheet extends StatefulWidget {
  final TaskModel? taskModel;
  final String sheetTitle;
  final String buttonTitle;
  final bool isAdd;
  const MyModalSheet({
    super.key,
    required this.sheetTitle,
    required this.buttonTitle,
    required this.isAdd,
    this.taskModel,
  });

  @override
  State<MyModalSheet> createState() => _MyModalSheetState();
}

class _MyModalSheetState extends State<MyModalSheet> {
  final GlobalKey<FormState> _formkey = .new();

  final TextEditingController titleController = .new();
  final TextEditingController descriptionController = .new();
  bool status = false;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    super.initState();
    if (!widget.isAdd && widget.taskModel != null) {
      titleController.text = widget.taskModel!.title;
      descriptionController.text = widget.taskModel!.description ?? '';
      status = widget.taskModel!.isDone;

      if (widget.taskModel!.deadline != null) {
        selectedDate = widget.taskModel!.deadline;
        selectedTime = TimeOfDay(
          hour: widget.taskModel!.deadline!.hour,
          minute: widget.taskModel!.deadline!.minute,
        );
      }
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: selectedDate ?? DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff021526),
              onPrimary: Colors.white,
              onSurface: Color(0xff021526),
              tertiaryContainer: Color(0xff021526),
              onTertiaryContainer: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Color(0xff021526)),
            ),
          ),
          child: child!,
        );
      },
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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xff021526),
              onPrimary: Colors.white,
              onSurface: Color(0xff021526),
              tertiaryContainer: Color(0xff021526),
              onTertiaryContainer: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Color(0xff021526)),
            ),
          ),
          child: child!,
        );
      },
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff021526),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            height: 560.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: Text(
                        widget.sheetTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return S.of(context).title_empty_er;
                        } else {
                          return null;
                        }
                      },
                      maxLength: 15,
                      controller: titleController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        errorStyle: TextStyle(color: Colors.red),
                        labelText: S.of(context).title,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextField(
                      maxLines: 5,
                      minLines: 4,
                      controller: descriptionController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: S.of(context).description,
                        alignLabelWithHint: true,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.7,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            side: BorderSide(color: Colors.white, width: 1.w),
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            value: status,
                            onChanged: (val) {
                              setState(() {
                                status = val!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          S.of(context).mark_as_done,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              S.of(context).Due_date,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 95.w),
                            Text(
                              S.of(context).time,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  _pickDate(context);
                                },
                                child: Container(
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
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
                                            color: Colors.white,
                                            fontSize: 18.sp,
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
                                            Icons.calendar_month,
                                            color: Colors.white,
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
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
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
                                            color: Colors.white,
                                            fontSize: 18.sp,
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
                                            Icons.watch_later,
                                            color: Colors.white,
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
                    SizedBox(height: 30.h),
                    Center(
                      child: InkWell(
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

                            if (widget.isAdd) {
                              final newTaskId = await task.addTask(
                                FirebaseAuth.instance.currentUser!.uid,
                                TaskModel(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  isDone: status,
                                  deadline: finalDeadline,
                                ),
                              );

                              await NotificationService.scheduleDeadlineAlert(
                                TaskModel(
                                  id: newTaskId,
                                  title: titleController.text,
                                  deadline: finalDeadline,
                                ),
                              );
                            } else {
                              await NotificationService.cancelTaskNotifications(
                                widget.taskModel!.id!,
                              );

                              task.updateTask(
                                FirebaseAuth.instance.currentUser!.uid,
                                widget.taskModel!.id!,
                                {
                                  "title": titleController.text,
                                  "description": descriptionController.text,
                                  "isDone": status,
                                  "deadline": finalDeadline,
                                },
                              );
                              await NotificationService.scheduleDeadlineAlert(
                                TaskModel(
                                  id: widget.taskModel!.id,
                                  title: titleController.text,
                                  deadline: finalDeadline,
                                ),
                              );
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          width: 145.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                            child: Text(
                              widget.buttonTitle,
                              style: TextStyle(
                                color: Color(0xff021526),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
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
      ),
    );
  }
}
