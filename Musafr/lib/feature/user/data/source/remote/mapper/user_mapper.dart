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
}
