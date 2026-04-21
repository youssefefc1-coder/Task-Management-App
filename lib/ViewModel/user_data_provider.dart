import 'package:flutter/material.dart';
import 'package:task_management_app/Model/user_model.dart';
import 'package:task_management_app/Services/Database/user_services.dart';

class UserDataProvider extends ChangeNotifier {
  UserModel? user;

  Future<void> getUser(String uid) async {
    user = await UserServices().getUser(uid);
    notifyListeners();
  }

  Future<void> updateUserName(Map<String, dynamic> data, String uid) async {
    await UserServices().updateUserName(data, uid);
    await getUser(uid);
    notifyListeners();
  }
}
