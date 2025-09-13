import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_phone_use_case.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_phone_use_case.dart';
import 'package:musafr/feature/phone_number/data/repository/phone_number_repository_impl.dart';
import 'package:musafr/feature/phone_number/domain/use_case/validate_phone_number_use_case.dart';

import '../../authentication/domain/repository/auth_repository.dart';
import '../domain/repository/phone_number_repository.dart';
import '../domain/use_case/get_country_place_holder_phone_number_use_case.dart';

final phoneNumberDi = [
  RepositoryProvider<PhoneNumberRepository>(
    create: (context) => PhoneNumberRepositoryImpl(),
  ),
  RepositoryProvider<SignInPhoneNumberUseCase>(
    create:
        (context) => SignInPhoneNumberUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<SignUpPhoneNumberUseCase>(
    create:
        (context) => SignUpPhoneNumberUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<SignUpPhoneNumberUseCase>(
    create:
        (context) => SignUpPhoneNumberUseCase(context.read<AuthRepository>()),
  ),
  RepositoryProvider<ValidatePhoneNumberUseCase>(
    create:
        (context) =>
            ValidatePhoneNumberUseCase(context.read<PhoneNumberRepository>()),
  ),
  RepositoryProvider<GetCountryPlaceHolderPhoneNumberUseCase>(
    create:
        (context) =>
            GetCountryPlaceHolderPhoneNumberUseCase(context.read<PhoneNumberRepository>()),
  ),
];
