import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/View/Widgets/my_modal_sheet.dart';
import 'package:task_management_app/generated/l10n.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      backgroundColor: Color(0xff021526),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return MyModalSheet(
              sheetTitle: S.of(context).add_task,
              buttonTitle: S.of(context).add,
              isAdd: true,
            );
          },
        );
      },
      child: Text(
        "+",
        style: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 35.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
