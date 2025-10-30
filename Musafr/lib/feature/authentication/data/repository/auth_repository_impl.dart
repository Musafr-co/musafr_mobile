import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/data/local/source/share_preference/source.dart';
import 'package:musafr/feature/authentication/data/remote/source/remote_source.dart';
import 'package:musafr/feature/authentication/domain/model/login_request.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';

import '../../../../core/data/model/network_response.dart';
import '../../../user/data/source/remote/mapper/user_mapper.dart';
import '../../../user/data/source/remote/model/user_dto.dart';
import '../../../user/domain/modal/user_modal.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  final AuthPreferenceSource authPreferenceSource;

  AuthRepositoryImpl({
    required this.authRemoteSource,
    required this.authPreferenceSource,
  });

  @override
  Future<DomainResponse<UserModal?>> signInUserWithEmail(
    LoginRequest request,
  ) async {
    try {
      NetworkResponse<UserDto> response = await authRemoteSource
          .signInWithEmailAndPass(request);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            await authPreferenceSource.saveUserAuthToken(
              domainResponse.data!.authToken,
            );
            await authPreferenceSource.saveUserRefreshToken(
              domainResponse.data!.refreshToken,
            );
            UserModal userModel = UserMapper.toDomain(domainResponse.data);

            return DomainSuccess<UserModal>(userModel)
                as DomainResponse<UserModal>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
                as DomainResponse<UserModal?>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: "Something went wrong", data: null);
    }
  }

  @override
  Future<DomainResponse<UserModal?>> signUpUserWithEmail(
    SignUpRequest request,
  ) async {
    try {
      NetworkResponse<UserDto> response = await authRemoteSource
          .signUpWithEmailAndPass(request);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            await authPreferenceSource.saveUserAuthToken(
              domainResponse.data!.authToken,
            );
            await authPreferenceSource.saveUserRefreshToken(
              domainResponse.data!.refreshToken,
            );
            UserModal userModel = UserMapper.toDomain(domainResponse.data);

            return DomainSuccess<UserModal>(userModel)
                as DomainResponse<UserModal?>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
                as DomainResponse<UserModal?>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<void>> loginWithPhoneNumber(String phoneNumber) async {
    try {
      NetworkResponse<UserDto> response = await authRemoteSource
          .signInWithPhoneNumber(phoneNumber);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            await authPreferenceSource.saveUserAuthToken(
              domainResponse.data!.authToken,
            );
            await authPreferenceSource.saveUserRefreshToken(
              domainResponse.data!.refreshToken,
            );
            UserModal userModel = UserMapper.toDomain(domainResponse.data);

            return DomainSuccess<void>(null) as DomainResponse<void>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
                as DomainResponse<void>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<void>> signUpWithPhoneNumber(String phoneNumber) async {
    try {
      NetworkResponse<void> response = await authRemoteSource
          .signUpWithPhoneNumber(phoneNumber);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            return DomainSuccess<void>(null);
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null);
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<UserModal>> verifyOTPForSignIn(
    String phoneNumber,
    String otp,
  ) async {
    try {
      NetworkResponse<UserDto> response = await authRemoteSource
          .verifyOtpForLogIn(phoneNumber, otp);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            UserModal userModel = UserMapper.toDomain(domainResponse.data);
            return DomainSuccess<UserModal>(userModel)
                as DomainResponse<UserModal>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: phoneNumber)
                as DomainResponse<UserModal>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<UserModal>> verifyOTPForSignUp(
    String phoneNumber,
    String otp,
  ) async {
    try {
      NetworkResponse<UserDto> response = await authRemoteSource
          .verifyOtpForSignUp(phoneNumber, otp);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            UserModal userModel = UserMapper.toDomain(domainResponse.data);
            return DomainSuccess<UserModal>(userModel)
                as DomainResponse<UserModal>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: phoneNumber)
                as DomainResponse<UserModal>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<void>> signOut() async {
    try {
      NetworkResponse<void> response = await authRemoteSource.signOut();
      DomainResponse remoteDomainResponse = response.toDomainResponse();
      switch (remoteDomainResponse) {
        case DomainSuccess():
          {
            await authPreferenceSource.signOut();
            return DomainSuccess<void>(null);
          }
        case DomainFailure():
          {
            return DomainFailure(error: remoteDomainResponse.error, data: null);
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<Stream<DomainResponse<UserModal?>>> getCurrentUserInformation() {
    // TODO: implement getCurrentUserInformation
     throw UnimplementedError();
  }
}
