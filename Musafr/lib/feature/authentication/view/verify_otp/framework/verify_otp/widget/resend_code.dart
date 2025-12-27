import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_cubit.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_state.dart';

import '../../../../../../../core/view/color/color.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocSelector<VerifyOtpCubit, VerifyOtpState, int>(
        selector: (state) => state.timer,
        builder: (context, timer) {
          return timer > 1
              ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8,
                ),
                child: Text.rich(
                  TextSpan(
                    text: 'Resend in  ',
                    children: [
                      TextSpan(
                        text: timer.toString(),
                        style: TextStyle(color: textLinkColor),
                      ),
                      TextSpan(
                        text: " seconds",
                        style: TextStyle(color: textLinkColor),
                      ),
                    ],
                  ),
                ),
              )
              : GestureDetector(
                onTap: () => context.read<VerifyOtpCubit>().resendOtp(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8,
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'Resend Code',
                      style: TextStyle(color: textLinkColor),
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
