class ProjectModel {
  String? id;

  String name;

  ProjectModel({
    this.id,
    required this.name,
  });

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['\$id'] as String?,
      name: map['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
