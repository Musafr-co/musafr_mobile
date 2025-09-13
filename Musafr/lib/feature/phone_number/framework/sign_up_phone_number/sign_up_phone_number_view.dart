import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/view_model/sign_up_phone_number_cubit.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/view_model/sign_up_phone_number_state.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/widget/sign_up_button_view.dart';
import 'package:musafr/feature/phone_number/framework/widget/country_select_list.dart';
import 'package:musafr/feature/phone_number/framework/widget/phone_number_input_field.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../modal/country_modal.dart';

class SignUpPhoneNumberView extends StatelessWidget {
  const SignUpPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    final placeholder = context.select<SignUpPhoneNumberCubit, String>(
      (cubit) => cubit.state.countryState.data?.countryPlaceHolder ?? "",
    );
    return MultiBlocListener(
      listeners: [

        LoadingDialogListener<SignUpPhoneNumberCubit, SignUpPhoneNumberState>(
          isLoading: (s) => s.screenState is UiLoading,
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),

        ErrorDialogListener<SignUpPhoneNumberCubit, SignUpPhoneNumberState>(
          screenStateSelector: (s) => s.screenState,
          shouldShowError:
              (s) =>
                  s.screenState is UiError &&
                  ((s.screenState as UiError).data ?? false),
          errorMessageSelector:
              (s) =>
                  s.screenState is UiError
                      ? (s.screenState as UiError).message
                      : '',
          onAcknowledge:
              () => context.read<SignUpPhoneNumberCubit>().resetErrorState(),
        ),
      ],
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 0),
            child: Column(
              spacing: 4,
              children: [
                SvgPicture.asset('assets/icons/app_icon_dark.svg', width: 120),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Complete your account",
                        textAlign: TextAlign.start, // center align text
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
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocSelector<
                      SignUpPhoneNumberCubit,
                      SignUpPhoneNumberState,
                      UiState<CountryModal?>
                    >(
                      selector: (state) => state.countryState,
                      builder: (context, countryState) {
                        return AppCountrySelectList(
                          onCountryChanged: (CountryModal value) {
                            context
                                .read<SignUpPhoneNumberCubit>()
                                .updateCountry(value);
                          },
                          selectedCountry: countryState,
                        );
                      },
                    ),
                    BlocSelector<
                      SignUpPhoneNumberCubit,
                      SignUpPhoneNumberState,
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
                                    .read<SignUpPhoneNumberCubit>()
                                    .updatePhoneNumber(value ?? ""),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SignUpButtonView(),
                SizedBox(height: 26),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8,
                    ),
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: textLinkColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
