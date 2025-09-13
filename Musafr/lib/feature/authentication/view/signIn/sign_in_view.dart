import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/feature/authentication/view/signIn/view_model/sign_in_cubit.dart';
import 'package:musafr/feature/authentication/view/signIn/view_model/sign_in_screen_state.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/button/primary_button.dart';
import '../../../../core/view/widgets/button/social_button.dart';
import '../../../../core/view/widgets/top_handle_view/top_handle_view.dart';
import '../signUp/sign_up_screen.dart';
import '../widget/email_edit_text.dart';
import '../widget/password_edit_text.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.95;

    return PopScope(
      canPop: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: maxHeight, // never exceed screen height
            ),
            child: Stack(
              children: [
                _SignInForm(),
                // BlocSelector<SignInCubit, SignInScreenState, bool>(
                //   selector: (state) => state.screenState is UiLoading,
                //   builder: (context, isLoading) {
                //     return DialogLoading(shouldShowDialog: isLoading);
                //   },
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min, // only take needed space
          children: [
            TopHandle(),
            _EmailField(),
            _PasswordField(),
            _LoginButton(),
            _Divider(),
            _SocialButtons(),
            _SignUpLink(),
            // dialogs...
          ],
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: BlocSelector<SignInCubit, SignInScreenState, UiState<String>>(
        selector: (state) => state.emailState,
        builder: (context, email) {
          return EmailEditText(
            value: email,
            onTextUpdate: context.read<SignInCubit>().updateEmail,
            placeholder: "Email",
          );
        },
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: BlocSelector<SignInCubit, SignInScreenState, UiState<String>>(
        selector: (state) => state.passwordState,
        builder: (context, password) {
          return PasswordEditTextWithHide(
            value: password,
            onTextUpdate: context.read<SignInCubit>().updatePassword,
            placeholder: "Password",
          );
        },
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: BlocSelector<SignInCubit, SignInScreenState, bool>(
        selector: (state) => state.screenState.data ?? false,
        builder: (context, isEnabled) {
          return PrimaryButton(
            onClick: context.read<SignInCubit>().signIn,
            text: const Text("Login"),
            enabled: isEnabled,
          );
        },
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _DividerLine(),
          const Text("or continue with"),
          const _DividerLine(),
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(height: 1, color: dividerColor),
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: ContinueWithSocialButton(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: ContinueWithSocialButton(
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
        ),
      ],
    );
  }
}

class _SignUpLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSignUpBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Text.rich(
          TextSpan(
            text: 'Don\'t have an account? ',
            children: [
              TextSpan(text: 'Sign Up', style: TextStyle(color: textLinkColor)),
            ],
          ),
        ),
      ),
    );
  }
}
