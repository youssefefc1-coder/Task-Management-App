import 'package:flutter/material.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/generated/l10n.dart';

extension CategoryLocalization on Category {
  String localizedName(BuildContext context) {
    switch (this) {
      case Category.work:
        return S.of(context).work;
      case Category.personal:
        return S.of(context).personal;
      case Category.urgent:
        return S.of(context).urgent;
      case Category.health:
        return S.of(context).health;
      case Category.sport:
        return S.of(context).sport;
      case Category.study:
        return S.of(context).study;
      case Category.shopping:
        return S.of(context).shopping;
      default:
        return S.of(context).general;
    }
  }
}
