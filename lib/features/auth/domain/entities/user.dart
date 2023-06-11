import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.isVerified,
  });

  final String id;
  String get firstName => fullName.split(' ').first;
  final String fullName;
  final String email;
  final bool isVerified;

  @override
  List<Object> get props => [id];
}
