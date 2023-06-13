import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String name;
  const Project({
    required this.id,
    required this.name,
  });

  Project copyWith({
    String? id,
    String? name,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
