class TaskModel {
  String? id;

  String title;

  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.isDone,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['\$id'] as String?,
      title: map['title'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }
}
