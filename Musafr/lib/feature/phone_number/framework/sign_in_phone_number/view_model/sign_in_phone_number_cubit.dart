import 'package:bloc/bloc.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_in_phone_use_case.dart';
import 'package:musafr/feature/phone_number/domain/use_case/validate_phone_number_use_case.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_state.dart';
import 'package:musafr/feature/validator/domain/model/validation_result.dart';

import '../../../domain/use_case/get_country_place_holder_phone_number_use_case.dart';
import '../../modal/country_modal.dart';

class SignInPhoneNumberCubit extends Cubit<SignInPhoneNumberState> {
  final ValidatePhoneNumberUseCase validatePhoneNumberUseCase;
  final SignInPhoneNumberUseCase signInPhoneNumberUseCase;
  final GetCountryPlaceHolderPhoneNumberUseCase
  getCountryPlaceHolderPhoneNumberUseCase;

  SignInPhoneNumberCubit(
    this.validatePhoneNumberUseCase,
    this.signInPhoneNumberUseCase,
    this.getCountryPlaceHolderPhoneNumberUseCase,
  ) : super(SignInPhoneNumberState());

  void updatePhoneNumber(String phoneNumber) async {
    final phone =
        "${state.countryState.data?.countryPhoneCode ?? ""}$phoneNumber";
    final phoneResult = await validatePhoneNumberUseCase.validate(
      phone,
      state.countryState.data?.countryCode ?? "",
    );
    switch (phoneResult) {
      case ValidationSuccess():
        {
          emit(state.copyWith(phoneState: UiSuccess(data: phoneNumber)));
          break;
        }
      case ValidationFailure(:final validationMessage):
        {
          emit(
            state.copyWith(
              phoneState: UiError(
                data: phoneNumber,
                message: validationMessage,
              ),
            ),
          );
          break;
        }
    }
    updateSignInEnabled();
  }

  void gotoSignUp() {
    emit(state.copyWith(switchScreenState: true));
    updateSignInEnabled();
  }

  Future<void> updateCountry(CountryModal country) async {
    emit(state.copyWith(countryState: UiLoading(data: country)));
    final response = await getCountryPlaceHolderPhoneNumberUseCase.invoke(
      country.countryCode ?? "",
    );
    switch (response) {
      case DomainSuccess():
        {
          final updatedModal = CountryModal(
            countryCode: country.countryCode,
            countryName: country.countryName,
            countryIcon: country.countryIcon,
            countryPhoneCode: country.countryPhoneCode,
            countryPlaceHolder: response.data,
          );
          emit(state.copyWith(countryState: UiSuccess(data: updatedModal)));
          updateSignInEnabled();
          return;
        }
      case DomainFailure(:final error):
        {
          emit(
            state.copyWith(
              countryState: UiError(data: country, message: error),
            ),
          );
          updateSignInEnabled();
          return;
        }
    }
  }

  Future<void> signInUsingPhoneNumber() async {
    emit(state.copyWith(screenState: UiLoading()));
    final phone =
        "${state.countryState.data?.countryCode ?? ""}${state.phoneState.data}";
    await Future.delayed(Duration(seconds: 2));
    final result = await signInPhoneNumberUseCase.call(phone);
    switch (result) {
      case DomainSuccess():
        {
          emit(state.copyWith(screenState: UiSuccess(data: false)));
          return;
        }
      case DomainFailure(:final error):
        {
          emit(
            state.copyWith(
              screenState: UiError(message: error, data: false),
              switchScreenState: false,
            ),
          );
          return;
        }
    }
  }

  void updateSignInEnabled() {
    emit(
      state.copyWith(screenState: UiIdle(data: state.phoneState is UiSuccess)),
    );
  }

  void resetErrorState() {
    emit(state.copyWith(screenState: UiIdle(data: false)));
  }

  void resetNavigation() {
    emit(state.copyWith(switchScreenState: false));
    updateSignInEnabled();
  }
}
