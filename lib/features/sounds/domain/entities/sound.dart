import 'package:equatable/equatable.dart';

class Sound extends Equatable {
  final String id;
  final String image;
  final String sound;
  const Sound({
    required this.id,
    required this.image,
    required this.sound,
  });

  Sound copyWith({
    String? id,
    String? image,
    String? sound,
  }) {
    return Sound(
      id: id ?? this.id,
      image: image ?? this.image,
      sound: sound ?? this.sound,
    );
  }

  @override
  List<Object?> get props => [id];
}
