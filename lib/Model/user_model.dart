class UserModel {
  String name;
  String email;

  UserModel({required this.name, required this.email});

  factory UserModel.fromFirestore(Map<String, dynamic> user) {
    return UserModel(name: user["name"], email: user["email"]);
  }

  Map<String, dynamic> toFirestore() {
    return {"name": name, "email": email};
  }
}
