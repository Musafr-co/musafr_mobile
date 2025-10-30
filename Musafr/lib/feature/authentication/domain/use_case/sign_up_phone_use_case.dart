import '../../../../core/domain/model/domain_response.dart';
import '../repository/auth_repository.dart';

class SignUpPhoneNumberUseCase {
  final AuthRepository _authRepository;

  SignUpPhoneNumberUseCase(this._authRepository);

  Future<DomainResponse<void>> call(String phoneNumber) async {
    return await _authRepository.signUpWithPhoneNumber(phoneNumber);
  }
}
