import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Model/task_model.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onChange,
  });

  final Category selectedCategory;
  final void Function(Category category) onChange;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.w,
      children: [
        MaterialButton(
          onPressed: () {
            onChange(Category.General);
          },
          height: 35.h,
          color: selectedCategory == Category.General
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "General",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.General
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Work);
          },
          height: 35.h,
          color: selectedCategory == Category.Work
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Work",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Work
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Urgent);
          },
          height: 35.h,
          color: selectedCategory == Category.Urgent
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Urgent",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Urgent
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Sport);
          },
          height: 35.h,
          color: selectedCategory == Category.Sport
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Sport",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Sport
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Personal);
          },
          height: 35.h,
          color: selectedCategory == Category.Personal
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Personal",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Personal
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Health);
          },
          height: 35.h,
          color: selectedCategory == Category.Health
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Health",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Health
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Study);
          },
          height: 35.h,
          color: selectedCategory == Category.Study
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Study",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Study
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.Shopping);
          },
          height: 35.h,
          color: selectedCategory == Category.Shopping
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: BorderSide(
              width: 1.5.w,
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.4),
            ),
          ),
          child: Text(
            "Shopping",
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.Shopping
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
