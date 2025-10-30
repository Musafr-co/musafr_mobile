import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/user/domain/use_case/save_current_user_use_case.dart';

import '../../../user/domain/modal/user_modal.dart';
import '../repository/auth_repository.dart';

class SignInEmailUseCase {
  final AuthRepository authRepository;

  final SaveCurrentUserUseCase saveCurrentUserUseCase;

  SignInEmailUseCase(this.authRepository, this.saveCurrentUserUseCase);

  Future<DomainResponse<UserModal?>> call(LoginRequest request) async {
    final response = await authRepository.signInUserWithEmail(request);
    switch (response) {
      case DomainSuccess():
        {
          if (response.data != null) {
            final updateResponse = await saveCurrentUserUseCase.invoke(
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
