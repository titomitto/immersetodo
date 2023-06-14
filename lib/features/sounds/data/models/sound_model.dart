class SoundsModel {
  String id;

  String image;
  String sound;

  SoundsModel({
    required this.id,
    required this.image,
    required this.sound,
  });

  factory SoundsModel.fromMap(Map<String, dynamic> map) {
    return SoundsModel(
      id: map['\$id'] as String,
      image: map['image'] == null ? "" : map['image'] as String,
      sound: map['sound'] as String,
    );
  }
}
