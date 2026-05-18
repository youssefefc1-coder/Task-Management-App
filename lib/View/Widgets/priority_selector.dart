import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Extensions/priority_extension.dart';
import 'package:task_management_app/Model/task_model.dart';

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onChange,
  });

  final Priority selectedPriority;
  final ValueChanged<Priority> onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {
            onChange(Priority.low);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == Priority.low
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
              Priority.low.localizedName(context),
              style: TextStyle(
                color: selectedPriority == Priority.low
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
            onChange(Priority.medium);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == Priority.medium
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
              Priority.medium.localizedName(context),
              style: TextStyle(
                color: selectedPriority == Priority.medium
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
            onChange(Priority.high);
          },
          height: 50.h,
          minWidth: 110.w,
          color: selectedPriority == Priority.high
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
              Priority.high.localizedName(context),
              style: TextStyle(
                color: selectedPriority == Priority.high
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
