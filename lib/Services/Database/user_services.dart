import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_app/Model/user_model.dart';

class UserServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> userExists(String uid) async {
    final user = await _db.collection('users').doc(uid).get();
    return user.exists;
  }

  Future<void> saveUser(UserModel user, String uid) async {
    await _db.collection('users').doc(uid).set(user.toFirestore());
  }

  Future<UserModel?> getUser(String uid) async {
    final user = await _db.collection('users').doc(uid).get();
    if (!user.exists) return null;
    return UserModel.fromFirestore(user.data() as Map<String, dynamic>);
  }

  Future<void> updateUserName(Map<String, dynamic> data, String uid) async {
    await _db.collection('users').doc(uid).update(data);
  }
}
