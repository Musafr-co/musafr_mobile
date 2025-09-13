import '../../../../../../../core/view/ui_state/ui_state.dart';

class VerifyOtpState {
  bool isSignUp;
  String phoneNumber;
  int timer;
  UiState<String> otpInput;
  bool moveToNextStep;

  VerifyOtpState({
    this.isSignUp = false,
    this.moveToNextStep = false,
    this.phoneNumber = "",
    this.timer = 0,
    this.otpInput = const UiIdle(data: ""),
  });

  VerifyOtpState copyWith({
    bool? isSignUp,
    bool? moveToNextStep,
    String? phoneNumber,
    int? timer,
    UiState<String>? otpInput,
  }) {
    return VerifyOtpState(
      isSignUp: isSignUp ?? this.isSignUp,
      moveToNextStep: moveToNextStep ?? this.moveToNextStep,
      timer: timer ?? this.timer,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otpInput: otpInput ?? this.otpInput,
    );
  }
}
