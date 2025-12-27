import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import '../../../../user/data/source/remote/model/user_dto.dart';

abstract class AuthRemoteSource {
  Future<NetworkResponse<UserDto>> signInWithEmailAndPass(LoginRequest request);

  Future<NetworkResponse<UserDto>> signUpWithEmailAndPass(
    SignUpRequest request,
  );

  Future<NetworkResponse<void>> signUpWithPhoneNumber(String phoneNumber);

  Future<NetworkResponse<UserDto>> signInWithPhoneNumber(String phoneNumber);

  Future<NetworkResponse<UserDto>> verifyOtpForLogIn(
    String phoneNumber,
    String otp,
  );

  Future<NetworkResponse<UserDto>> verifyOtpForSignUp(
    String phoneNumber,
    String otp,
  );

  Future<NetworkResponse<void>> signOut();
}
