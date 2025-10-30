import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_email_use_case.dart';
import 'package:musafr/feature/authentication/view/signIn/sign_in_view.dart';
import 'package:musafr/feature/authentication/view/signIn/view_model/sign_in_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/sign_in_phone_number_screen.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_email_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_password_use_case.dart';

import '../../../validator/domain/use_case/validate_name_use_case.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final double screenHeight = MediaQuery.of(context).size.height * 0.9;
    return BlocProvider<SignInCubit>(
      create:
          (context) => SignInCubit(
            context.read<ValidatePasswordUseCase>(),
            context.read<ValidateNameUseCase>(),
            context.read<SignInEmailUseCase>(),
          ),
      child: SignInWidget(),
    );
  }
}

void showSignInSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SignInScreen();
    },
  );
}
