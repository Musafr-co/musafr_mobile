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

import '../data/local/source/share_preference/source.dart';
import '../data/repository/auth_repository_impl.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/use_case/check_otp_for_sign_in_use_case.dart';

final authRepositoryProvider = [
  RepositoryProvider<AuthRemoteSource>(
    create: (context) => AuthRemoteSourceImpl(),
  ),
  RepositoryProvider<AuthPreferenceSource>(
    create: (context) => AuthSharePreferenceImpl(),
  ),
  RepositoryProvider<AuthRemoteSource>(
    create: (context) => AuthRemoteSourceImpl(),
  ),
  RepositoryProvider<AuthRepository>(
    create:
        (context) => AuthRepositoryImpl(
          authRemoteSource: context.read<AuthRemoteSource>(),
          authPreferenceSource: context.read<AuthPreferenceSource>(),
        ),
  ),
  RepositoryProvider<SignInEmailUseCase>(
    create: (context) => SignInEmailUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<SignInPhoneNumberUseCase>(
    create:
        (context) => SignInPhoneNumberUseCase(
          context.read<AuthRepository>(),
        ),
  ),
  RepositoryProvider<SignUpEmailUseCase>(
    create:
        (context) => SignUpEmailUseCase(
          context.read<AuthRepository>(),
        ),
  ),
  RepositoryProvider<SignUpPhoneNumberUseCase>(
    create:
        (context) => SignUpPhoneNumberUseCase(
          context.read<AuthRepository>()
        )
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
