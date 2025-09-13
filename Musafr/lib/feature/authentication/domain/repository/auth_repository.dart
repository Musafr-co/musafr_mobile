import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import '../../../../core/domain/model/domain_response.dart';
import '../../../user/domain/modal/user_modal.dart';

abstract class AuthRepository {
  Future<DomainResponse<UserModal>> signInUserWithEmail(LoginRequest request);
  Future<DomainResponse<UserModal>> signUpUserWithEmail(SignUpRequest request);
  Future<DomainResponse<void>> signUpWithPhoneNumber(String phoneNumber);
  Future<DomainResponse<void>> loginWithPhoneNumber(String phoneNumber);
  Future<DomainResponse<UserModal>> verifyOTPForSignIn(String phoneNumber, String otp);
  Future<DomainResponse<UserModal>> verifyOTPForSignUp(String phoneNumber, String otp);
  Future<DomainResponse<void>> signOut();
}
