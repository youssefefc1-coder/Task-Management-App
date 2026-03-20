import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/ViewModel/locale_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class LangAlertDialog extends StatelessWidget {
  const LangAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.r),
      ),
      title: Text(
        S.of(context).choose_language,
        style: TextStyle(color: Color(0xff021526)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: Colors.white,
            title: Text(
              (S.of(context).system_default),
              style: TextStyle(color: Color(0xff021526)),
            ),
            onTap: () {
              provider.clearLocale();
              Navigator.pop(context);
            },
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              S.of(context).english,
              style: TextStyle(color: Color(0xff021526)),
            ),
            onTap: () {
              provider.setLocale(Locale("en"));
              Navigator.pop(context);
            },
          ),
          ListTile(
            tileColor: Colors.white,
            title: Text(
              S.of(context).arabic,
              style: TextStyle(color: Color(0xff021526)),
            ),
            onTap: () {
              provider.setLocale(Locale("ar"));
              Navigator.pop(context);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            S.of(context).cancel,
            style: TextStyle(color: Color(0xff021526)),
          ),
        ),
      ],
    );
  }
}
