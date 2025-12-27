import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_state.dart';

import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../../../core/view/widgets/button/primary_button.dart';

class SignInButtonView extends StatelessWidget {
  const SignInButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      SignInPhoneNumberCubit,
      SignInPhoneNumberState,
      UiState<bool>
    >(
      selector: (state) => state.screenState,
      builder: (context, isEnabled) {
        return PrimaryButton(
          onClick:
              context.read<SignInPhoneNumberCubit>().signInUsingPhoneNumber,
          text: const Text("Login"),
          enabled: isEnabled.data ?? false,
        );
      },
    );
  }
}
