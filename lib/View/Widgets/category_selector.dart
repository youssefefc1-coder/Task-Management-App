import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/generated/l10n.dart';

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
            onChange(Category.general);
          },
          height: 35.h,
          color: selectedCategory == Category.general
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
            S.of(context).general,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.general
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.work);
          },
          height: 35.h,
          color: selectedCategory == Category.work
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
            S.of(context).work,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.work
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.urgent);
          },
          height: 35.h,
          color: selectedCategory == Category.urgent
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
            S.of(context).urgent,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.urgent
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.sport);
          },
          height: 35.h,
          color: selectedCategory == Category.sport
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
            S.of(context).sport,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.sport
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.personal);
          },
          height: 35.h,
          color: selectedCategory == Category.personal
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
            S.of(context).personal,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.personal
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.health);
          },
          height: 35.h,
          color: selectedCategory == Category.health
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
            S.of(context).health,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.health
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.study);
          },
          height: 35.h,
          color: selectedCategory == Category.study
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
            S.of(context).study,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.study
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            onChange(Category.shopping);
          },
          height: 35.h,
          color: selectedCategory == Category.shopping
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
            S.of(context).shopping,
            style: TextStyle(
              fontSize: 14.sp,
              color: selectedCategory == Category.shopping
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
