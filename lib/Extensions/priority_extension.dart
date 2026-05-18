import 'package:flutter/material.dart';
import 'package:task_management_app/Model/task_model.dart';

import 'package:task_management_app/generated/l10n.dart';

extension PriorityLocalization on Priority {
  String localizedName(BuildContext context) {
    switch (this) {
      case Priority.high:
        return S.of(context).high;
      case Priority.medium:
        return S.of(context).medium;
      case Priority.low:
        return S.of(context).low;
    }
  }
}
