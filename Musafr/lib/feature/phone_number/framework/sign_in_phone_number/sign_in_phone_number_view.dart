import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/view/verify_otp/framework/verify_otp/verify_otp_screen.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_state.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/widget/sign_in_button_view.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/widget/sign_up_link.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../modal/country_modal.dart';
import '../sign_up_phone_number/sign_up_phone_number_screen.dart';
import '../widget/country_select_list.dart';
import '../widget/phone_number_input_field.dart';

class SignInPhoneNumberView extends StatelessWidget {
  const SignInPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholder = context.select<SignInPhoneNumberCubit, String>(
      (cubit) => cubit.state.countryState.data?.countryPlaceHolder ?? "",
    );
    return MultiBlocListener(
      listeners: [
        LoadingDialogListener<SignInPhoneNumberCubit, SignInPhoneNumberState>(
          isLoading: (s) => s.screenState is UiLoading,
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),
        ErrorDialogListener<SignInPhoneNumberCubit, SignInPhoneNumberState>(
          screenStateSelector: (s) => s.screenState,
          shouldShowError: (s) {
            return s.screenState is UiError &&
                ((s.screenState as UiError).data != null);
          },
          errorMessageSelector:
              (s) =>
                  s.screenState is UiError
                      ? (s.screenState as UiError).message
                      : '',
          onAcknowledge:
              () => context.read<SignInPhoneNumberCubit>().resetErrorState(),
        ),
        BlocListener<SignInPhoneNumberCubit, SignInPhoneNumberState>(
          listenWhen:
              (previous, current) =>
                  previous.switchScreenState != current.switchScreenState,
          listener: (context, state) {
            if (state.switchScreenState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignUpPhoneNumberScreen(),
                ),
              );
              context.read<SignInPhoneNumberCubit>().resetNavigation();
            }
          },
        ),
        BlocListener<SignInPhoneNumberCubit, SignInPhoneNumberState>(
          listenWhen:
              (previous, current) =>
                  previous.screenState != current.screenState,
          listener: (_, state) {
            if (state.screenState is UiSuccess) {
              context.read<SignInPhoneNumberCubit>().resetNavigation();
              showVerifyOtpScreen(
                context,
                "${state.countryState.data?.countryPhoneCode ?? ""}${state.phoneState.data}",
                false,
              );
            }
          },
        ),
      ],
      child: Column(
        spacing: 4,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Hi, Welcome Back!",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: titleTextColor,
              ),
            ),
          ),
          Text(
            "Welcome back! Log in to your account to access all your features securely.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: dividerColor,
            ),
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocSelector<
                SignInPhoneNumberCubit,
                SignInPhoneNumberState,
                UiState<CountryModal?>
              >(
                selector: (state) => state.countryState,
                builder: (context, countryState) {
                  return AppCountrySelectList(
                    onCountryChanged: (CountryModal value) {
                      context.read<SignInPhoneNumberCubit>().updateCountry(
                        value,
                      );
                    },
                    selectedCountry: countryState,
                  );
                },
              ),
              BlocSelector<
                SignInPhoneNumberCubit,
                SignInPhoneNumberState,
                UiState<String>
              >(
                selector: (state) => state.phoneState,
                builder: (context, phoneNumber) {
                  return Expanded(
                    child: PhoneNumberInputField(
                      placeHolder: placeholder,
                      phoneNumber: phoneNumber,
                      onPhoneUpdate:
                          (String? value) => context
                              .read<SignInPhoneNumberCubit>()
                              .updatePhoneNumber(value ?? ""),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          SignInButtonView(),
          SizedBox(height: 26),
          SignUpLink(),
        ],
      ),
    );
  }
}
