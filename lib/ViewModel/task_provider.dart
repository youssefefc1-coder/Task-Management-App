import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/Database/task_services.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  String _filter = "all";

  List<TaskModel> get filteredTasks {
    if (_filter == "done") {
      return tasks.where((element) => element.isDone == true).toList();
    } else if (_filter == "notDone") {
      return tasks.where((element) => element.isDone == false).toList();
    } else {
      return tasks;
    }
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }

  StreamSubscription? _subscription;

  void listenToTasks(String uid, {bool descending = false}) {
    _subscription?.cancel();

    _subscription = TaskServices().getTasks(uid, descending: descending).listen(
      (data) {
        tasks = data;
        notifyListeners();
      },
    );
  }

  Future<String> addTask(String uid, TaskModel task) async {
    return await TaskServices().addTask(uid, task);
  }

  Future<void> updateTask(
    String uid,
    String taskId,
    Map<String, dynamic> data,
  ) async {
    await TaskServices().updateTask(uid, taskId, data);
  }

  Future<void> deleteTask(String uid, String taskId) async {
    await TaskServices().deleteTask(uid, taskId);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void stopListening() {
    _subscription?.cancel();
    tasks = [];
    notifyListeners();
  }
}
