import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_management_app/Model/task_model.dart';
import 'package:task_management_app/Services/Database/task_services.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];

  List<Category> _selectedCategory = [];

  List<Category> get selectedCategory => _selectedCategory;

  List<TaskModel> get filteredTasks {
    if (selectedCategory.isEmpty) return tasks;

    return tasks
        .where((task) => selectedCategory.contains(task.category))
        .toList();
  }

  void toggleCategory(Category category) {
    if (selectedCategory.contains(category)) {
      selectedCategory.remove(category);
    } else {
      selectedCategory.add(category);
    }
    notifyListeners();
  }

  void clearAllCategories() {
    selectedCategory.clear();
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
