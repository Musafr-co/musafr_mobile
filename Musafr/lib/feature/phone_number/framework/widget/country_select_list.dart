import 'package:flutter/material.dart';
import 'package:musafr/feature/phone_number/framework/modal/country_modal.dart';
import 'package:musafr/feature/phone_number/framework/select_country_list.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/ui_state/ui_state.dart';

class AppCountrySelectList extends StatelessWidget {
  final ValueChanged<CountryModal> onCountryChanged;
  final UiState<CountryModal?> selectedCountry;

  const AppCountrySelectList({
    super.key,
    required this.onCountryChanged,
    required this.selectedCountry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0, 10, 0),
      child: Stack(
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: phoneBorderColor, width: 1),
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: CountrySelectList(
              modal: selectedCountry,

              onChanged: (value) => onCountryChanged(value),
              onInit: (value) => onCountryChanged(value),
            ),
          ),
          if (selectedCountry is UiLoading)
            Positioned.fill(child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
