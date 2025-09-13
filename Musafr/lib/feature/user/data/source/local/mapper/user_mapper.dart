
import '../../../../domain/modal/user_modal.dart';
import '../modal/user_entity.dart';

class UserLocalMapper {
  static UserEntity fromDomain(UserModal user) {
    return UserEntity(
      id: user.id,
      name: user.name,
      profilePicture: user.profilePicture,
      phoneNumber: user.phone,
    );
  }

  static UserModal toDomain(UserEntity userEntity) {
    return UserModal(
      id: userEntity.id,
      name: userEntity.name,
      profilePicture: userEntity.profilePicture,
      phone: userEntity.phoneNumber,
    );
  }
}
