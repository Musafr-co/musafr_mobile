import '../../../../../core/view/ui_state/ui_state.dart';
import '../../modal/country_modal.dart';

class SignUpPhoneNumberState {
  UiState<String> phoneState;

  UiState<CountryModal?> countryState;

  UiState<bool> screenState;

  bool switchScreenState;

  SignUpPhoneNumberState({
    this.phoneState = const UiIdle(data: ""),
    this.countryState = const UiIdle(data: null),
    this.screenState = const UiIdle(data: false),
    this.switchScreenState =  false,
  });

  SignUpPhoneNumberState copyWith({
    UiState<String>? phoneState,
    UiState<CountryModal>? countryState,
    UiState<bool>? screenState,
    bool? switchScreenState,
  }) {
    return SignUpPhoneNumberState(
      phoneState: phoneState ?? this.phoneState,
      countryState: countryState ?? this.countryState,
      screenState: screenState ?? this.screenState,
      switchScreenState: switchScreenState ?? this.switchScreenState,
    );
  }

}
