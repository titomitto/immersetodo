import '../../domain/entities/user.dart';
import '../models/user_model.dart';

extension UserExtension on UserModel {
  User toEntity() => User(
        id: id,
        fullName: fullName,
        email: email,
        isVerified: isVerified,
      );
}

extension UserModelExtension on User {
  UserModel toModel() => UserModel(
        id: id,
        fullName: fullName,
        email: email,
        isVerified: isVerified,
      );
}
