import '../../../../../core/view/ui_state/ui_state.dart';

class SignInScreenState {
  UiState<String> emailState;

  UiState<String> passwordState;

  UiState<bool> screenState;

  SignInScreenState({
    this.emailState = const UiIdle(data: ""),
    this.passwordState = const UiIdle(data: ""),
    this.screenState = const UiIdle(data: false),
  });

  SignInScreenState copyWith({
    UiState<String>? emailState,
    UiState<String>? passwordState,
    UiState<bool>? screenState,
  }) {
    return SignInScreenState(
      emailState: emailState ?? this.emailState,
      passwordState: passwordState ?? this.passwordState,
      screenState: screenState ?? this.screenState,
    );
  }
}
