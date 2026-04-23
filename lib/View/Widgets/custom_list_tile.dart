import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    bool status = false;
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
        color: Theme.of(context).colorScheme.secondary,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 2,
            color: Color(0xff000000).withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10.w),
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                value: status,
                onChanged: (val) {
                  status = val!;
                },
                shape: CircleBorder(),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2.w,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Finish Flutter Project",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Container(
                  height: 22.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(16.r),
                      right: Radius.circular(16.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Work",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 22.w),
            Container(
              height: 22.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Center(
                child: Text(
                  "HIGH",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            SizedBox(width: 3.w),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                size: 26.sp,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
