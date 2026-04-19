class TaskModel {
  final String? id;
  final String title;
  final String? description;
  final String priority;
  final String category;
  final bool isDone;
  final DateTime? deadline;

  TaskModel({
    required this.title,
    this.description,
    this.isDone = false,
    this.id,
    this.deadline,
    this.priority = 'Low',
    this.category = 'General',
  });

  factory TaskModel.fromFirestore(Map<String, dynamic> data, String id) {
    return TaskModel(
      id: id,
      title: data['title'],
      description: data['description'],
      isDone: data['isDone'],
      deadline: data['deadline']?.toDate(),
      priority: data['priority'],
      category: data['category'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "isDone": isDone,
      "deadline": deadline,
      "priority": priority,
      "category": category,
    };
  }
}
