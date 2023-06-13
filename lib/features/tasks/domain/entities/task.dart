import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final bool isDone;
  const Task({
    required this.id,
    required this.title,
    required this.isDone,
  });

  Task copyWith({
    String? id,
    String? title,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, title];
}
