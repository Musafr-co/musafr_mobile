import 'package:musafr/core/data/model/network_response.dart';

import '../model/user_dto.dart';

abstract class UserRemoteSource {
  Future<NetworkResponse<UserDto>> getCurrentUser();

  Future<NetworkResponse<void>> saveCurrentUser(UserDto user);
}
