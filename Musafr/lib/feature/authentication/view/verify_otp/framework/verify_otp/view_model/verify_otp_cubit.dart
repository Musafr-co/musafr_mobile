import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/authentication/domain/use_case/check_out_for_sign_up_use_case.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_state.dart';
import 'package:musafr/feature/timer/domain/use_case/start_timer_use_case.dart';
import 'package:musafr/feature/timer/domain/use_case/stop_timer_use_case.dart';

import '../../../../../../../core/view/ui_state/ui_state.dart';
import '../../../../../../timer/domain/use_case/get_timer_time_use_case.dart';
import '../../../../../domain/use_case/check_otp_for_sign_in_use_case.dart';
import '../../../../../domain/use_case/sign_in_phone_use_case.dart';
import '../../../../../domain/use_case/sign_up_phone_use_case.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final CheckOtpForLoginUseCase checkOtpForLoginUseCase;
  final CheckOtpForSignUpUseCase checkOtpForSignUpUseCase;
  final SignUpPhoneNumberUseCase signUpPhoneNumberUseCase;
  final SignInPhoneNumberUseCase signInPhoneNumberUseCase;
  final StartTimerUseCase startTimerUseCase;
  final StopTimerUseCase stopTimerUseCase;
  final GetTimerTimeUseCase getTimerTimeUseCase;

  final String phoneNumber;
  final bool isFromSignUp;

  StreamSubscription<int>? _timerSubscription;

  VerifyOtpCubit(
    this.checkOtpForLoginUseCase,
    this.checkOtpForSignUpUseCase,
    this.signUpPhoneNumberUseCase,
    this.signInPhoneNumberUseCase,
    this.startTimerUseCase,
    this.stopTimerUseCase,
    this.getTimerTimeUseCase, {
    required this.isFromSignUp,
    required this.phoneNumber,
  }) : super(VerifyOtpState(isSignUp: isFromSignUp, phoneNumber: phoneNumber)) {
    startTimer();
  }

  Future<void> resendOtp() async {
    final phone = state.phoneNumber;
    emit(state.copyWith(otpInput: UiLoading(data: state.otpInput.data)));

    final response =
        state.isSignUp
            ? await signUpPhoneNumberUseCase.call(phone)
            : await signInPhoneNumberUseCase.call(phone);
    switch (response) {
      case DomainSuccess():
        {
          if (!isClosed) {
            emit(state.copyWith(otpInput: UiSuccess(data: "")));
          }
        }
      case DomainFailure(:final error):
        {
          if (!isClosed) {
            emit(state.copyWith(otpInput: UiError(data: "", message: error)));
          }
        }
    }
  }

  void startTimer() {
    startTimerUseCase.execute(60);
    getTimerTime();
  }

  void stopTimer() {
    stopTimerUseCase.execute();
    _timerSubscription?.cancel();
    _timerSubscription = null;

    if (!isClosed) {
      emit(state.copyWith(timer: 0));
    }
  }

  Future<void> onOtpUpdated(String otp) async {
    if (!isClosed) {
      emit(state.copyWith(otpInput: UiSuccess(data: otp)));
    }

    if (otp.length < 4) {
      return;
    }

    if (!isClosed) {
      emit(state.copyWith(otpInput: UiLoading(data: otp)));
    }

    await Future.delayed(Duration(seconds: 2));

    final response =
        state.isSignUp
            ? await checkOtpForSignUpUseCase.invoke(state.phoneNumber, otp)
            : await checkOtpForLoginUseCase.invoke(state.phoneNumber, otp);

    switch (response) {
      case DomainSuccess():
        {
          if (!isClosed) {
            stopTimer();
            emit(
              state.copyWith(
                otpInput: UiSuccess(data: ""),
                moveToNextStep: true,
              ),
            );
          }
        }
      case DomainFailure(:final error):
        {
          emit(
            state.copyWith(otpInput: UiSuccess(data: ""), moveToNextStep: true),
          );
          // if (!isClosed) {
          //   emit(state.copyWith(otpInput: UiError(data: "", message: error)));
          // }
        }
    }
  }

  void resetNavigation() {
    if (!isClosed) {
      emit(state.copyWith(moveToNextStep: false));
    }
  }

  void getTimerTime() {
    _timerSubscription?.cancel();

    _timerSubscription = getTimerTimeUseCase.execute().listen(
      (timeLeft) {
        if (!isClosed) {
          emit(state.copyWith(timer: timeLeft));
        }
      },
      onError: (error) {
        if (!isClosed) {
          emit(state.copyWith(timer: 0));
        }
      },
    );
  }

  void resetErrorState() {
    if (!isClosed) {
      emit(state.copyWith(otpInput: UiIdle(data: "")));
    }
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    _timerSubscription = null;
    stopTimerUseCase.execute();
    return super.close();
  }
}
