import 'package:bloc/bloc.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_email_use_case.dart';
import 'package:musafr/feature/authentication/view/signIn/view_model/sign_in_screen_state.dart';
import 'package:musafr/feature/validator/domain/model/validation_result.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_email_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_password_use_case.dart';

import '../../../domain/model/login_request.dart';

class SignInCubit extends Cubit<SignInScreenState> {
  final ValidateEmailUseCase validateEmailUseCase;
  final ValidatePasswordUseCase validatePasswordUseCase;
  final SignInEmailUseCase signInEmailUseCase;

  SignInCubit(
    this.validateEmailUseCase,
    this.validatePasswordUseCase,
    this.signInEmailUseCase,
  ) : super(SignInScreenState());

  void updateEmail(String email) {
    final emailState = validateEmailUseCase.validate(email);
    switch (emailState) {
      case ValidationSuccess():
        {
          emit(state.copyWith(emailState: UiSuccess(data: email)));
          break;
        }
      case ValidationFailure(:final validationMessage):
        {
          emit(
            state.copyWith(
              emailState: UiError(data: email, message: validationMessage),
            ),
          );
          break;
        }
    }
    _setupScreenState();
  }

  void updatePassword(String password) {
    final validation = validatePasswordUseCase.validate(password);
    switch (validation) {
      case ValidationSuccess():
        {
          emit(state.copyWith(passwordState: UiSuccess(data: password)));
          break;
        }
      case ValidationFailure(:final validationMessage):
        {
          emit(
            state.copyWith(
              passwordState: UiError(
                data: password,
                message: validationMessage,
              ),
            ),
          );
          break;
        }
    }
    _setupScreenState();
  }

  void _setupScreenState() {
    if (state.passwordState is UiSuccess && state.emailState is UiSuccess) {
      emit(state.copyWith(screenState: UiSuccess(data: true)));
    } else {
      emit(state.copyWith(screenState: UiSuccess(data: false)));
    }
  }

  Future<void> signIn() async {

    final email = state.emailState.data;
    final password = state.passwordState.data;
    if (state.emailState is! UiSuccess) {
      updateEmail(email ?? "");
      return;
    } else if (state.passwordState is! UiSuccess) {
      updatePassword(password ?? "");
      return;
    }
    emit(state.copyWith(screenState: UiLoading()));
    await Future.delayed(Duration(seconds: 2));
    final loginRequest = LoginRequest(email: email!, password: password!);
    final result = await signInEmailUseCase.call(loginRequest);
    switch (result) {
      case DomainSuccess():
        {
          emit(state.copyWith(screenState: UiSuccess(data: false)));
          return;
        }
      case DomainFailure(:final error):
        {
          emit(
            state.copyWith(screenState: UiError(data: false, message: error)),
          );
          return;
        }
    }
  }

  void resetErrorState() {
    emit(state.copyWith(screenState: UiSuccess(data: true)));
  }
}
