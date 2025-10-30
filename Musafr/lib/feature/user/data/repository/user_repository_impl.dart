import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/user/data/source/local/source/local_source.dart';
import 'package:musafr/feature/user/data/source/remote/source/user_remote_source.dart';
import 'package:musafr/feature/user/domain/repository/user_repository.dart';

import '../../domain/modal/user_modal.dart';
import '../source/remote/mapper/user_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteSource userRemoteSource;
  final UserLocalSource userLocalSource;

  UserRepositoryImpl({
    required this.userRemoteSource,
    required this.userLocalSource,
  });

  @override
  Future<DomainResponse<UserModal>> getCurrentUser() async {
    final user = await userLocalSource.getCurrentUser();
    if (user == null) {
      final response = await userRemoteSource.getCurrentUser();
      return DomainFailure(error: "No user found", data: null);
    }

    return DomainSuccess(UserMapper.fromEntity(user));
  }

  @override
  Future<DomainResponse<void>> saveCurrentUser(
    UserModal user, {
    required bool saveLocalOnly,
  }) async {
    if (saveLocalOnly) {
      final response = userLocalSource.saveCurrentUser(
        UserMapper.toEntity(user),
      );
      return DomainSuccess<void>(null) as DomainResponse<void>;
    }
    final response = await userRemoteSource.saveCurrentUser(
      UserMapper.fromDomain(user),
    );
    return response.toDomainResponse();
  }
}
