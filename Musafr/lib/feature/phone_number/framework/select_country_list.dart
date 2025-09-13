import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:musafr/feature/phone_number/framework/modal/country_modal.dart';

import '../../../core/util/context_extension.dart';
import '../../../core/view/ui_state/ui_state.dart';
import 'modal/mapper/country_mapper.dart';

class CountrySelectList extends StatelessWidget {
  final UiState<CountryModal?> modal;
  final ValueChanged<CountryModal> onChanged;
  final ValueChanged<CountryModal> onInit;

  const CountrySelectList({
    super.key,
    required this.modal,
    required this.onChanged,
    required this.onInit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountryCodePicker(
        padding: const EdgeInsets.all(0.0),
        onChanged: (code) {
          onChanged(CountryMapper.fromFramework(code));
        },
        favorite: ['QA'],
        // optional. Shows only country name and flag
        showCountryOnly: false,
        // optional. Shows only country name and flag when popup is closed.
        showOnlyCountryWhenClosed: false,
        // optional. aligns the flag and the Text left
        alignLeft: false,
        flagWidth: 20,
        initialSelection: getDeviceCountryCode(),
        onInit: (value) {
          if (value != null) onInit(CountryMapper.fromFramework(value));
        },
        pickerStyle: PickerStyle.bottomSheet,
      ),
    );
  }
}
