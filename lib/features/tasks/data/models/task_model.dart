class TaskModel {
  String? id;

  String title;
  String description;

  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['\$id'] as String?,
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }
}
