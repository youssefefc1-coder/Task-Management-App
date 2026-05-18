enum Priority { low, medium, high }

enum Category {
  general,
  personal,
  work,
  urgent,
  health,
  sport,
  study,
  shopping,
}

class TaskModel {
  final String? id;
  final String title;
  final String? description;
  final Priority priority;
  final Category category;
  final bool isDone;
  final DateTime? deadline;

  TaskModel({
    required this.title,
    this.description,
    this.isDone = false,
    this.id,
    this.deadline,
    this.priority = Priority.medium,
    this.category = Category.general,
  });

  factory TaskModel.fromFirestore(Map<String, dynamic> data, String id) {
    return TaskModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isDone: data['isDone'],
      deadline: data['deadline']?.toDate(),
      priority: Priority.values.byName(data['priority']),
      category: Category.values.byName(data['category']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "description": description,
      "isDone": isDone,
      "deadline": deadline,
      "priority": priority.name,
      "category": category.name,
    };
  }
}
