import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Model/task_model.dart';

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onChange,
  });

  final TaskPriority selectedPriority;
  final ValueChanged<TaskPriority> onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {
            onChange(TaskPriority.Low);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == TaskPriority.Low
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Center(
            child: Text(
              TaskPriority.Low.name,
              style: TextStyle(
                color: selectedPriority == TaskPriority.Low
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(TaskPriority.Medium);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == TaskPriority.Medium
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Center(
            child: Text(
              TaskPriority.Medium.name,
              style: TextStyle(
                color: selectedPriority == TaskPriority.Medium
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(TaskPriority.High);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == TaskPriority.High
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Center(
            child: Text(
              TaskPriority.High.name,
              style: TextStyle(
                color: selectedPriority == TaskPriority.High
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
