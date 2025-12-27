import '../modal/user_entity.dart';

abstract class UserLocalSource {
  Future<UserEntity?> getCurrentUser();

  Future<void> saveCurrentUser(UserEntity user);
}
