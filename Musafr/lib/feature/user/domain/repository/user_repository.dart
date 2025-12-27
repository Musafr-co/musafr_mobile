import '../../../../core/domain/model/domain_response.dart';
import '../modal/user_modal.dart';

abstract class UserRepository {
  Future<DomainResponse<UserModal?>> getCurrentUser();

  Future<DomainResponse<void>> saveCurrentUser(UserModal user, {required bool saveLocalOnly});
}
