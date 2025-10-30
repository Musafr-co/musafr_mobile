import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/user/domain/repository/user_repository.dart';

import '../modal/user_modal.dart';

class GetCurrentUserUseCase {
  final UserRepository userRepository;

  GetCurrentUserUseCase(this.userRepository);

  Future<DomainResponse<UserModal?>> invoke() async {
    return await userRepository.getCurrentUser();
  }
}
