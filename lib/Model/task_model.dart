class TaskModel {
  final String title;
  final String? description;
  final bool isDone;
  final String? id;
  final DateTime? deadline;

  TaskModel({
    required this.title,
    this.description,
    this.isDone = false,
    this.id,
    this.deadline,
  });

  factory TaskModel.fromFirestore(Map<String, dynamic> data, String id) {
    return TaskModel(
      title: data['title'],
      description: data['description'],
      isDone: data['isDone'],
      id: id,
      deadline: data['deadline']?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "isDone": isDone,
      "deadline": deadline,
    };
  }
}
