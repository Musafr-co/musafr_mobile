import 'package:flutter/material.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../authentication/view/widget/phone_number_edit_text.dart';

class PhoneNumberInputField extends StatelessWidget {
  final String? placeHolder;
  final UiState<String> phoneNumber;
  final ValueChanged<String?> onPhoneUpdate;

  const PhoneNumberInputField({
    super.key,
    required this.placeHolder,
    required this.phoneNumber,
    required this.onPhoneUpdate,
  });

  @override
  Widget build(BuildContext context) {
    // final placeholder = context.select<SignUpPhoneNumberCubit, String>(
    //   (cubit) => cubit.state.countryState.data?.countryPlaceHolder ?? "",
    // );
    return SizedBox(
      child: PhoneNumberEditText(
        value: phoneNumber,
        onTextUpdate: onPhoneUpdate,
        placeholder: placeHolder,
        textStyle: TextStyle(),
      ),
    );
  }
}
