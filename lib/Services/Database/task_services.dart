import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/Model/task_model.dart';

class TaskServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference _tasksRef(String uid) {
    return _db.collection('users').doc(uid).collection('tasks');
  }

  Stream<List<TaskModel>> getTasks(String uid, {bool descending = true}) {
    return _tasksRef(uid).snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (docs) => TaskModel.fromFirestore(
              docs.data() as Map<String, dynamic>,
              docs.id,
            ),
          )
          .toList(),
    );
  }

  Future<String> addTask(String uid, TaskModel task) async {
    final docRef = await _tasksRef(uid).add(task.toFirestore());
    return docRef.id;
  }

  Future<void> updateTask(
    String uid,
    String taskId,
    Map<String, dynamic> data,
  ) async {
    await _tasksRef(uid).doc(taskId).update(data);
  }

  Future<void> deleteTask(String uid, String taskId) async {
    await _tasksRef(uid).doc(taskId).delete();
  }
}
