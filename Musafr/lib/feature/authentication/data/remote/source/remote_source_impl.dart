import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';
import 'package:musafr/feature/user/data/source/remote/model/user_dto.dart';

import 'remote_source.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final ApiClient apiClient;

  AuthRemoteSourceImpl(this.apiClient);

  @override
  Future<NetworkResponse<UserDto>> signInWithEmailAndPass(
    LoginRequest request,
  ) async {
    final response = await apiClient.post(
      "api/v1/auth/login",
      data: {'username': request.userName, 'password': request.password},
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        UserDto user = UserDto.fromJson(
          response.data['data'],
        );

        return NetworkSuccess<UserDto>(user, "Success", response.statusCode!);
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(error: response.data, data: null);
    }
  }

  @override
  Future<NetworkResponse<UserDto>> signUpWithEmailAndPass(
    SignUpRequest request,
  ) async {
    final response = await apiClient.post(
      "api/v1/auth/register",
      data: {'username': request.userName,
        'email': request.email,
        'password': request.password,},
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        UserDto user = UserDto.fromJson(response.data as Map<String, dynamic>);

        return NetworkSuccess<UserDto>(user, "Success", response.statusCode!);
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(error: response.data[0]["description"], data: null);
    }
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
