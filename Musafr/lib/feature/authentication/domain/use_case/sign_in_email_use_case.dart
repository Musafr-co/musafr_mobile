import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';

import '../../../user/domain/modal/user_modal.dart';
import '../repository/auth_repository.dart';

class SignInEmailUseCase {
  final AuthRepository authRepository;

  SignInEmailUseCase(this.authRepository);

  Future<DomainResponse<UserModal>> call(LoginRequest request) {
    return authRepository.signInUserWithEmail(request);
  }
}
