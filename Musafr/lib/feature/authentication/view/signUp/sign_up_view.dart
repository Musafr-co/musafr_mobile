import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/color/color.dart';
import 'package:musafr/feature/authentication/view/signUp/view_model/sign_up_cubit.dart';
import 'package:musafr/feature/authentication/view/signUp/view_model/sign_up_state.dart';
import 'package:musafr/feature/authentication/view/widget/name_edit_text.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/button/primary_button.dart';
import '../../../../core/view/widgets/button/social_button.dart';
import '../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../../core/view/widgets/top_handle_view/top_handle_view.dart';
import '../widget/email_edit_text.dart';
import '../widget/password_edit_text.dart';
import '../widget/referral_edit_text.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        LoadingDialogListener<SignUpCubit, SignUpState>(
          isLoading: (s) => s.screenState is UiLoading,
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),
        ErrorDialogListener<SignUpCubit, SignUpState>(
          screenStateSelector: (s) => s.screenState,
          shouldShowError:
              (s) =>
          s.screenState is UiError &&
              ((s.screenState as UiError).data != null),
          errorMessageSelector:
              (s) =>
          s.screenState is UiError
              ? (s.screenState as UiError).message
              : '',
          onAcknowledge:
              () => context.read<SignUpCubit>().resetErrorState(),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.center,child: TopHandle()),
              _Header(),
              _TitleSection(),
              _FormFields(),
              _SocialLoginSection(),
              _Footer()
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            "assets/icons/arrow-left.svg",
            semanticsLabel: 'Back Arrow',
            width: 22,
            height: 22,
          ),
        ),
        Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: titleTextColor,
          ),
        ),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        Text(
          "Complete your account",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: titleTextColor,
          ),
        ),
        Text(
          "Finish setting up your account now.",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: dividerColor,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _FormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        BlocSelector<SignUpCubit, SignUpState, UiState<String>>(
          selector: (state) => state.nameState,
          builder: (context, name) {
            return NameEditText(
              value: name,
              onTextUpdate: context.read<SignUpCubit>().updateName,
              placeholder: "UserName",
            );
          },
        ),
        BlocSelector<SignUpCubit, SignUpState, UiState<String>>(
          selector: (state) => state.emailState,
          builder: (context, email) {
            return EmailEditText(
              value: email,
              onTextUpdate: context.read<SignUpCubit>().updateEmail,
              placeholder: "Email",
            );
          },
        ),
        BlocSelector<SignUpCubit, SignUpState, UiState<String>>(
          selector: (state) => state.passwordState,
          builder: (context, password) {
            return PasswordEditTextWithHide(
              value: password,
              onTextUpdate: context.read<SignUpCubit>().updatePassword,
              placeholder: "Password",
            );
          },
        ),
        BlocSelector<SignUpCubit, SignUpState, UiState<String>>(
          selector: (state) => state.confirmPasswordState,
          builder: (context, confirm) {
            return PasswordEditTextWithHide(
              value: confirm,
              onTextUpdate: context.read<SignUpCubit>().updateConfirmPassword,
              placeholder: "Confirm Password",
            );
          },
        ),
        BlocSelector<SignUpCubit, SignUpState, String>(
          selector: (state) => state.referralCodeState.data ?? "",
          builder: (context, referral) {
            return ReferralCodeEditText(
              value: referral,
              onTextUpdate: context.read<SignUpCubit>().updateReferralCode,
            );
          },
        ),
        BlocSelector<SignUpCubit, SignUpState, bool>(
          selector: (state) => state.screenState.data ?? false,
          builder: (context, isEnabled) {
            return PrimaryButton(
              onClick: context.read<SignUpCubit>().signUpUser,
              text: const Text("Sign Up"),
              enabled: isEnabled,
            );
          },
        ),
      ],
    );
  }
}

class _SocialLoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(color: dividerColor, height: 1),
              ),
            ),
            const Text("or continue with"),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(color: dividerColor, height: 1),
              ),
            ),
          ],
        ),
        ContinueWithSocialButton(
          startIcon: SvgPicture.asset(
            "assets/icons/google_icon.svg",
            width: 22,
            height: 22,
          ),
          text: "Continue with Google",
          onClick: () {},
          enabled: true,
          endIcon: null,
        ),
        ContinueWithSocialButton(
          startIcon: SvgPicture.asset(
            "assets/icons/apple_icon.svg",
            width: 22,
            height: 22,
          ),
          text: "Continue with Apple",
          onClick: () {},
          enabled: true,
          endIcon: null,
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Align(
        alignment: Alignment.center,
        child: Text.rich(
          TextSpan(
            text: 'Already have an account? ',
            children: [
              TextSpan(text: 'Login', style: TextStyle(color: textLinkColor)),
            ],
          ),
        ),
      ),
    );
  }
}
