import '../../../../../core/view/ui_state/ui_state.dart';

class SignInScreenState {
  UiState<String> userNameState;

  UiState<String> passwordState;

  UiState<bool> screenState;
  bool switchScreenState;

  SignInScreenState({
    this.userNameState = const UiIdle(data: ""),
    this.passwordState = const UiIdle(data: ""),
    this.screenState = const UiIdle(data: false),
    this.switchScreenState = false
  });

  SignInScreenState copyWith({
    UiState<String>? userNameState,
    UiState<String>? passwordState,
    UiState<bool>? screenState,
    bool? switchScreenState,
  }) {
    return SignInScreenState(
      userNameState: userNameState ?? this.userNameState,
      passwordState: passwordState ?? this.passwordState,
      screenState: screenState ?? this.screenState,
      switchScreenState: switchScreenState ?? this.switchScreenState,
    );
  }
}
