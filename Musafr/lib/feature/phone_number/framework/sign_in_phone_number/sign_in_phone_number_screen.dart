import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/phone_number/domain/use_case/validate_phone_number_use_case.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/sign_in_phone_number_view.dart';
import 'package:musafr/feature/phone_number/framework/sign_in_phone_number/view_model/sign_in_phone_number_cubit.dart';

import '../../../authentication/domain/use_case/sign_in_phone_use_case.dart';
import '../../domain/use_case/get_country_place_holder_phone_number_use_case.dart';

class SignInPhoneNumberScreen extends StatelessWidget {
  const SignInPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInPhoneNumberCubit>(
      create:
          (context) => SignInPhoneNumberCubit(
            context.read<ValidatePhoneNumberUseCase>(),
            context.read<SignInPhoneNumberUseCase>(),
            context.read<GetCountryPlaceHolderPhoneNumberUseCase>(),
          ),
      child: SignInPhoneNumberView(),
    );
  }
}
