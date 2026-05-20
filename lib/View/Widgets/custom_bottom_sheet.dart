import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

class CustomModalBottomSheet extends StatefulWidget {
  const CustomModalBottomSheet({super.key, required this.name});
  final String name;

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  children: [
                    Text(
                      S.of(context).edit_name,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).field_cant_be_empty;
                        }
                        return null;
                      },
                      controller: nameController,
                      maxLength: 15,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Theme.of(
                              context,
                            ).inputDecorationTheme.border!.borderSide.color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusedBorder!
                                .borderSide
                                .color,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .enabledBorder!
                                .borderSide
                                .color,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .errorBorder!
                                .borderSide
                                .color,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            width: 2.w,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .focusedErrorBorder!
                                .borderSide
                                .color,
                          ),
                        ),
                        hintText: S.of(context).name,
                        hintStyle: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.4),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    MaterialButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<UserDataProvider>().updateUserName(
                            {'name': nameController.text},
                            FirebaseAuth.instance.currentUser!.uid,
                          );
                          Navigator.pop(context);
                        }
                      },
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      minWidth: 150.w,
                      color: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12.r),
                      ),
                      child: Text(
                        S.of(context).update_name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
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
