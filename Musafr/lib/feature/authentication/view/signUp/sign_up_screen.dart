import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_email_use_case.dart';
import 'package:musafr/feature/authentication/view/signUp/sign_up_view.dart';
import 'package:musafr/feature/authentication/view/signUp/view_model/sign_up_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/sign_up_phone_number_screen.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_email_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_name_use_case.dart';
import 'package:musafr/feature/validator/domain/use_case/validate_password_use_case.dart';

void showSignUpBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    barrierColor: Colors.white,
    useSafeArea: true,
    enableDrag: false,
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height;

      return SizedBox(height: screenHeight, child: SignUpScreen());
    },
  );
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create:
          (context) => SignUpCubit(
            context.read<ValidateEmailUseCase>(),
            context.read<ValidatePasswordUseCase>(),
            context.read<SignUpEmailUseCase>(),
            context.read<ValidateNameUseCase>(),
          ),
      child: SignUpView(),
    );
  }
}
