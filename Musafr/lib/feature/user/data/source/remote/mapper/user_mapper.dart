import 'package:musafr/feature/user/data/source/local/modal/user_entity.dart';

import '../../../../domain/modal/user_modal.dart';
import '../model/user_dto.dart';

class UserMapper {
  static UserDto fromDomain(UserModal user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      profilePicture: user.profilePicture,
    );
  }

  static UserModal toDomain(UserDto userDto) {
    return UserModal(
      id: userDto.id,
      name: userDto.name,
      email: userDto.email,
      profilePicture: userDto.profilePicture,
    );
  }

  static UserModal fromEntity(UserEntity user) {
    return UserModal(
      id: user.id,
      name: user.name,
      profilePicture: user.profilePicture,
      email: null,
      phone: user.phoneNumber,
    );
  }

  static UserEntity toEntity(UserModal user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      phoneNumber: user.phone,
      profilePicture: user.profilePicture,
    );
  }
}
