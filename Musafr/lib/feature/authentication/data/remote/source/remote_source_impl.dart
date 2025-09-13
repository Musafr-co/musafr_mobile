import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/feature/user/data/source/remote/model/user_dto.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import 'remote_source.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<NetworkResponse<UserDto>> signInWithEmailAndPass(
    LoginRequest request,
  ) {
    // TODO: implement signInWithEmailAndPass
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<UserDto>> signUpWithEmailAndPass(
    SignUpRequest request,
  ) {
    // TODO: implement signInWithEmailAndPass
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<UserDto>> signInWithPhoneNumber(String phoneNumber) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<void>> signUpWithPhoneNumber(String phoneNumber) {
    // TODO: implement signUpWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<UserDto>> verifyOtpForLogIn(
    String phoneNumber,
    String otp,
  ) {
    // TODO: implement verifyOtpForLogIn
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<UserDto>> verifyOtpForSignUp(
    String phoneNumber,
    String otp,
  ) {
    // TODO: implement verifyOtpForSignUp
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
