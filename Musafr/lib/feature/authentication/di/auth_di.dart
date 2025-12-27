import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/data/local/source/share_preference/source_impl.dart';
import 'package:musafr/feature/authentication/data/remote/source/remote_source.dart';
import 'package:musafr/feature/authentication/data/remote/source/remote_source_impl.dart';
import 'package:musafr/feature/authentication/domain/use_case/check_out_for_sign_up_use_case.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_email_use_case.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_phone_use_case.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_email_use_case.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_phone_use_case.dart';
import 'package:musafr/feature/user/domain/use_case/save_current_user_use_case.dart';

import '../../../core/network/data/client/api_client.dart';
import '../data/local/source/share_preference/source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/use_case/check_otp_for_sign_in_use_case.dart';

final authDi = [
  RepositoryProvider<AuthRemoteSource>(
    create: (context) => AuthRemoteSourceImpl(context.read<ApiClient>()),
  ),
  RepositoryProvider<AuthRepository>(
    create:
        (context) => AuthRepositoryImpl(
          authRemoteSource: context.read<AuthRemoteSource>(),
          authPreferenceSource: context.read<AuthPreferenceSource>(),
        ),
  ),
  RepositoryProvider<SignInEmailUseCase>(
    create:
        (context) => SignInEmailUseCase(
          context.read<AuthRepository>(),
          context.read<SaveCurrentUserUseCase>(),
        ),
  ),
  RepositoryProvider<SignInPhoneNumberUseCase>(
    create:
        (context) => SignInPhoneNumberUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<SignUpEmailUseCase>(
    create:
        (context) => SignUpEmailUseCase(
          context.read<AuthRepository>(),
          context.read<SaveCurrentUserUseCase>(),
        ),
  ),
  RepositoryProvider<SignUpPhoneNumberUseCase>(
    create:
        (context) => SignUpPhoneNumberUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<CheckOtpForLoginUseCase>(
    create:
        (context) => CheckOtpForLoginUseCase(
          context.read<AuthRepository>(),
          context.read<SaveCurrentUserUseCase>(),
        ),
  ),
  RepositoryProvider<CheckOtpForSignUpUseCase>(
    create:
        (context) => CheckOtpForSignUpUseCase(
          context.read<AuthRepository>(),
          context.read<SaveCurrentUserUseCase>(),
        ),
  ),
];
