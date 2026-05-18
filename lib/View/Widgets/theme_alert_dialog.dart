import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/ViewModel/theme_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class ThemeAlertDialog extends StatelessWidget {
  const ThemeAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10.r),
      ),
      title: Text(
        S.of(context).choose_theme_mode,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            tileColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              S.of(context).system_default,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              provider.setTheme(ThemeMode.system);
              Navigator.pop(context);
            },
          ),
          ListTile(
            tileColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              S.of(context).dark_mode,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              provider.setTheme(ThemeMode.dark);

              Navigator.pop(context);
            },
          ),
          ListTile(
            tileColor: Theme.of(context).colorScheme.secondary,
            title: Text(
              S.of(context).light_mode,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              provider.setTheme(ThemeMode.light);

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
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
