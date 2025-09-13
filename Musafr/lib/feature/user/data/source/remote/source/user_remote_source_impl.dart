import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/feature/user/data/source/remote/model/user_dto.dart';
import 'package:musafr/feature/user/data/source/remote/source/user_remote_source.dart';

class UserRemoteSourceImpl extends UserRemoteSource {
  @override
  Future<NetworkResponse<UserDto>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<void>> saveCurrentUser(UserDto user) {
    // TODO: implement saveCurrentUser
    throw UnimplementedError();
  }
}
