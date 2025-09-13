import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/verify_otp_view.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_cubit.dart';

import '../../../../../timer/domain/use_case/get_timer_time_use_case.dart';
import '../../../../../timer/domain/use_case/start_timer_use_case.dart';
import '../../../../../timer/domain/use_case/stop_timer_use_case.dart';
import '../../../../domain/use_case/check_otp_for_sign_in_use_case.dart';
import '../../../../domain/use_case/check_out_for_sign_up_use_case.dart';
import '../../../../domain/use_case/sign_in_phone_use_case.dart';
import '../../../../domain/use_case/sign_up_phone_use_case.dart';

class VerifyOtpScreen extends StatelessWidget {
  final bool isFromSignUp;
  final String phoneNumber;

  const VerifyOtpScreen({
    super.key,
    required this.isFromSignUp,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyOtpCubit>(
      create:
          (context) => VerifyOtpCubit(
            context.read<CheckOtpForLoginUseCase>(),
            context.read<CheckOtpForSignUpUseCase>(),
            context.read<SignUpPhoneNumberUseCase>(),
            context.read<SignInPhoneNumberUseCase>(),
            context.read<StartTimerUseCase>(),
            context.read<StopTimerUseCase>(),
            context.read<GetTimerTimeUseCase>(),
            isFromSignUp: isFromSignUp,
            phoneNumber: phoneNumber,
          ),
      child: VerifyOtpView(),
    );
  }
}

void showVerifyOtpScreen(
  BuildContext context,
  String phoneNumber,
  bool isFromSignUp,
) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: true,
    enableDrag: false,
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height * 0.7;

      return SizedBox(
        height: screenHeight,
        child: VerifyOtpScreen(
          isFromSignUp: isFromSignUp,
          phoneNumber: phoneNumber,
        ),
      );
    },
  );
}
