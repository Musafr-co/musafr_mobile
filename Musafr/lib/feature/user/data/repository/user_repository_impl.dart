import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/user/data/source/local/source/local_source.dart';
import 'package:musafr/feature/user/data/source/remote/source/user_remote_source.dart';
import 'package:musafr/feature/user/domain/repository/user_repository.dart';

import '../../domain/modal/user_modal.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteSource userRemoteSource;
  final UserLocalSource userLocalSource;

  UserRepositoryImpl({
    required this.userRemoteSource,
    required this.userLocalSource,
  });

  @override
  Future<DomainResponse<UserModal>> getCurrentUser() async {
    return Future.value(DomainSuccess(UserModal(id: 1, name: "hello world")));
  }

  @override
  Future<DomainResponse<void>> saveCurrentUser(
    UserModal user, {
    required bool saveLocalOnly,
  }) {
    // TODO: implement saveCurrentUser
    throw UnimplementedError();
  }
}
