import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Extensions/category_extension.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/generated/l10n.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.category,
    required this.onSelect,
    required this.isSelected,
    required this.isFirstIndex,
  });
  final Category? category;
  final bool isFirstIndex;
  final bool isSelected;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              width: 2.w,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Center(
            child: Text(
              isFirstIndex
                  ? S.of(context).all
                  : category!.localizedName(context),
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
