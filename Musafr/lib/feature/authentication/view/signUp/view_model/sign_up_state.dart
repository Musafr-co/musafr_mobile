import '../../../../../core/view/ui_state/ui_state.dart';

class SignUpState{
  UiState<String> emailState;
  UiState<String> passwordState;
  UiState<String> nameState;
  UiState<String> confirmPasswordState;
  UiState<String> referralCodeState;
  UiState<bool?> screenState;

  SignUpState({
    this.emailState = const UiIdle(data: ""),
    this.nameState = const UiIdle(data: ""),
    this.passwordState = const UiIdle(data: ""),
    this.screenState = const UiIdle(data: false),
    this.confirmPasswordState = const UiIdle(data: ""),
    this.referralCodeState = const UiIdle(data: ""),
  });


  SignUpState copyWith({
    UiState<String>? emailState,
    UiState<String>? nameState,
    UiState<String>? passwordState,
    UiState<String>? confirmPasswordState,
    UiState<String>? referralCodeState,
    UiState<bool>? screenState,
  }) {
    return SignUpState(
      emailState: emailState ?? this.emailState,
      nameState: nameState ?? this.nameState,
      passwordState: passwordState ?? this.passwordState,
      confirmPasswordState: confirmPasswordState ?? this.confirmPasswordState,
      referralCodeState: referralCodeState ?? this.referralCodeState,
      screenState: screenState ?? this.screenState,
    );
  }
}