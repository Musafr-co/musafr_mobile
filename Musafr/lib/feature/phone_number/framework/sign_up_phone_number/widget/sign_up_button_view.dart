import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/view_model/sign_up_phone_number_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/view_model/sign_up_phone_number_state.dart';

import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../../../core/view/widgets/button/primary_button.dart';

class SignUpButtonView extends StatelessWidget {
  const SignUpButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      SignUpPhoneNumberCubit,
      SignUpPhoneNumberState,
      UiState<bool>
    >(
      selector: (state) => state.screenState,
      builder: (context, isEnabled) {
        return PrimaryButton(
          onClick:
              context.read<SignUpPhoneNumberCubit>().signInUsingPhoneNumber,
          text: const Text("Login"),
          enabled: isEnabled.data ?? false,
        );
      },
    );
  }
}
