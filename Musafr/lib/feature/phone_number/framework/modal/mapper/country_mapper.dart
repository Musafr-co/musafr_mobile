import 'package:country_code_picker/country_code_picker.dart';

import '../country_modal.dart';

class CountryMapper {
  static CountryModal fromFramework(CountryCode country) {
    return CountryModal(
      countryName: country.name ?? "",
      countryIcon: country.flagUri,
      countryCode: country.code,
      countryPhoneCode: country.dialCode,
        countryPlaceHolder: null,
    );
  }
}
