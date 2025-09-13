import 'package:bloc/bloc.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/authentication/domain/model/sign_up_request.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_email_use_case.dart';
import 'package:musafr/feature/authentication/view/signUp/view_model/sign_up_state.dart';
import 'package:musafr/feature/validator/domain/model/validation_result.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_email_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_password_use_case.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final ValidateEmailUseCase validateEmailUseCase;
  final ValidatePasswordUseCase validatePasswordUseCase;
  final SignUpEmailUseCase signUpEmailUseCase;

  SignUpCubit(
    this.validateEmailUseCase,
    this.validatePasswordUseCase,
    this.signUpEmailUseCase,
  ) : super(SignUpState());

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

  void updateConfirmPassword(String password) {
    final validation = validatePasswordUseCase.validate(password);
    switch (validation) {
      case ValidationSuccess():
        {
          if (password == state.passwordState.data) {
            emit(
              state.copyWith(confirmPasswordState: UiSuccess(data: password)),
            );
          } else {
            emit(
              state.copyWith(
                confirmPasswordState: UiError(
                  message: "The password does not match",
                  data: password,
                ),
              ),
            );
          }
          break;
        }
      case ValidationFailure(:final validationMessage):
        {
          emit(
            state.copyWith(
              confirmPasswordState: UiError(
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

  void updateReferralCode(String referralCode) {
    emit(state.copyWith(referralCodeState: UiSuccess(data: referralCode)));
  }

  void _setupScreenState() {
    if (state.passwordState is UiSuccess &&
        state.emailState is UiSuccess &&
        state.confirmPasswordState is UiSuccess) {
      emit(state.copyWith(screenState: UiSuccess(data: true)));
    } else {
      emit(state.copyWith(screenState: UiSuccess(data: false)));
    }
  }

  Future<void> signUpUser() async {
    final email = state.emailState.data;
    final password = state.passwordState.data;
    final referralCode = state.referralCodeState.data;
    if (state.emailState is! UiSuccess) {
      updateEmail(email ?? "");
      return;
    } else if (state.passwordState is! UiSuccess) {
      updatePassword(password ?? "");
      return;
    }
    emit(state.copyWith(screenState: UiLoading()));
    await Future.delayed(Duration(seconds: 2));
    final loginRequest = SignUpRequest(
      email: email!,
      password: password!,
      referralCode: referralCode ?? "",
    );
    final result = await signUpEmailUseCase.invoke(loginRequest);
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

  void resetErrorState() async {
    emit(state.copyWith(screenState: UiSuccess(data: true)));
  }
}
