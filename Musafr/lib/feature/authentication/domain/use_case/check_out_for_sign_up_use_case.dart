import '../../../../core/domain/model/domain_response.dart';
import '../../../user/domain/modal/user_modal.dart';
import '../../../user/domain/use_case/save_current_user_use_case.dart';
import '../repository/auth_repository.dart';

class CheckOtpForSignUpUseCase {
  final AuthRepository _authRepository;
  final SaveCurrentUserUseCase _saveCurrentUserUseCase;

  CheckOtpForSignUpUseCase(this._authRepository, this._saveCurrentUserUseCase);

  Future<DomainResponse<UserModal>> invoke(
    String phoneNumber,
    String otp,
  ) async {
    final response = await _authRepository.verifyOTPForSignUp(phoneNumber, otp);
    switch (response) {
      case DomainSuccess():
        {
          final updateResponse = await _saveCurrentUserUseCase.invoke(
            response.data,
            saveLocalOnly: true,
          );
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
