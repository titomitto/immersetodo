import '../../domain/entities/sound.dart';
import '../models/sound_model.dart';

extension SoundModelExtension on SoundsModel {
  Sound toEntity() => Sound(
        id: id,
        image: image,
        sound: sound,
      );
}

extension ExpenseEntityExtension on Sound {
  SoundsModel toModel() => SoundsModel(
        id: id,
        image: image,
        sound: sound,
      );
}
