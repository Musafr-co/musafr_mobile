import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/user/data/source/remote/model/user_dto.dart';
import 'package:musafr/feature/user/data/source/remote/source/user_remote_source.dart';

class UserRemoteSourceImpl extends UserRemoteSource {
  final ApiClient client;

  UserRemoteSourceImpl(this.client);

  @override
  Future<NetworkResponse<UserDto>> getCurrentUser() {
    // TODO: implement getCurrentUser
    try {
      throw Exception("My Error");
    } catch (exception) {
      return Future.value(NetworkException(exception as Exception));
    }
  }

  @override
  Future<NetworkResponse<void>> saveCurrentUser(UserDto user) {
    // TODO: implement saveCurrentUser
    throw UnimplementedError();
  }
}
