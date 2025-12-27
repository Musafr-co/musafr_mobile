import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_cubit.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/view_model/verify_otp_state.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/widget/resend_code.dart';

import '../../../../../../core/view/color/color.dart';
import '../../../../../../core/view/ui_state/ui_state.dart';
import '../../../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../../../../core/view/widgets/top_handle_view/top_handle_view.dart';
import '../../../../../home/framework/main/landing_screen.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneNumber = context.select<VerifyOtpCubit, String>(
      (cubit) => cubit.state.phoneNumber,
    );
    return MultiBlocListener(
      listeners: [
        LoadingDialogListener<VerifyOtpCubit, VerifyOtpState>(
          isLoading: (current) => current.otpInput is UiLoading,
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),
        ErrorDialogListener<VerifyOtpCubit, VerifyOtpState>(
          screenStateSelector: (s) => s.otpInput,
          shouldShowError:
              (s) =>
                  s.otpInput is UiError &&
                  ((s.otpInput as UiError).data ?? false),
          errorMessageSelector:
              (s) =>
                  s.otpInput is UiError
                      ? (s.otpInput as UiError).message ?? ''
                      : '',
          onAcknowledge: () => context.read<VerifyOtpCubit>().resetErrorState(),
        ),
        BlocListener<VerifyOtpCubit, VerifyOtpState>(
          listenWhen:
              (previous, current) =>
          previous.moveToNextStep != current.moveToNextStep,
          listener: (_, state) {
            if (state.moveToNextStep) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LandingScreen()),
                    (route) => false,
              );
              context.read<VerifyOtpCubit>().resetNavigation();
            }
          },
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              TopHandle(),
              SizedBox(
                width: double.infinity,
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verification Code",
                      textAlign: TextAlign.start, // center align text
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: titleTextColor,
                      ),
                    ),
                    Text(
                      "Finish setting up your account now for number $phoneNumber",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: dividerColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    OtpTextField(
                      numberOfFields: 4,
                      borderColor: phoneBorderColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                      enabledBorderColor: phoneBorderColor,
                      focusedBorderColor: phoneBorderColor,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {
                        context.read<VerifyOtpCubit>().onOtpUpdated(code);
                      },
                      onSubmit: (String verificationCode) {
                        context.read<VerifyOtpCubit>().onOtpUpdated(
                          verificationCode,
                        );
                      },
                      // end onSubmit
                      fieldWidth: MediaQuery.of(context).size.width / 4 - 16,
                    ),
                    const SizedBox(height: 10),
                    ResendCode(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
