import '../../../../core/domain/model/domain_response.dart';
import '../repository/auth_repository.dart';

class SignInPhoneNumberUseCase {
  final AuthRepository _authRepository;

  SignInPhoneNumberUseCase(this._authRepository);

  Future<DomainResponse<void>> call(String phoneNumber) async {
    return await _authRepository.loginWithPhoneNumber(phoneNumber);
  }
}
