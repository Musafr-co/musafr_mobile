import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import '../../../user/domain/modal/user_modal.dart';
import '../repository/auth_repository.dart';

class SignUpEmailUseCase {
  final AuthRepository _authRepository;

  SignUpEmailUseCase(this._authRepository);

  Future<DomainResponse<UserModal>> invoke(SignUpRequest request) async {
    return await _authRepository.signUpUserWithEmail(request);
  }
}
