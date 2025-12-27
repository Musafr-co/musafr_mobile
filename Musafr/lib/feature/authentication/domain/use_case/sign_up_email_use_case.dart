import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import '../../../user/domain/modal/user_modal.dart';
import '../../../user/domain/use_case/save_current_user_use_case.dart';
import '../repository/auth_repository.dart';

class SignUpEmailUseCase {
  final AuthRepository _authRepository;
  final SaveCurrentUserUseCase _saveCurrentUserUseCase;

  SignUpEmailUseCase(this._authRepository, this._saveCurrentUserUseCase);

  Future<DomainResponse<UserModal?>> invoke(SignUpRequest request) async {
    final response = await _authRepository.signUpUserWithEmail(request);
    switch (response) {
      case DomainSuccess():
        {
          if (response.data != null) {
            final updateResponse = await _saveCurrentUserUseCase.invoke(
              response.data!,
              saveLocalOnly: true,
            );
          }
          return response;
        }
      case DomainFailure():
        {
          return response;
        }
    }
    return response;
  }
}
