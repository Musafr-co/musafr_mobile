import '../../../../core/domain/model/domain_response.dart';
import '../modal/user_modal.dart';
import '../repository/user_repository.dart';

class SaveCurrentUserUseCase {
  final UserRepository userRepository;

  SaveCurrentUserUseCase(this.userRepository);

  Future<DomainResponse<void>> invoke(
    UserModal userModel, {
    bool saveLocalOnly = false,
  }) async {
    return await userRepository.saveCurrentUser(
      userModel,
      saveLocalOnly: saveLocalOnly,
    );
  }
}
