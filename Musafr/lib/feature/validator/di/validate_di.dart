import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_email_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_password_use_case.dart';

final validateDi = [
  RepositoryProvider<ValidatePasswordUseCase>(
    create: (context) => ValidatePasswordUseCase(),
  ),
  RepositoryProvider<ValidateEmailUseCase>(
    create: (context) =>
        ValidateEmailUseCase(),
  ),
  RepositoryProvider<ValidateEmailUseCase>(
    create: (context) =>
        ValidateEmailUseCase(),
  ),
  RepositoryProvider<ValidateEmailUseCase>(
    create: (context) =>
        ValidateEmailUseCase(),
  ),
];