import '../../../../core/domain/model/domain_response.dart';
import '../repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  Future<DomainResponse<void>> invoke() async {
    return authRepository.signOut();
  }
}
