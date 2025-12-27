import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_cubit.dart';

import '../../../../../core/view/color/color.dart';

class SignUpLink extends StatelessWidget {
  const SignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SignInPhoneNumberCubit>().gotoSignUp(),
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
