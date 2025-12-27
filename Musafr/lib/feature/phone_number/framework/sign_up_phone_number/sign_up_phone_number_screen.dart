import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/authentication/domain/use_case/sign_up_phone_use_case.dart';
import 'package:musafr/feature/phone_number/domain/use_case/validate_phone_number_use_case.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/sign_up_phone_number_view.dart';
import 'package:musafr/feature/phone_number/framework/sign_up_phone_number/view_model/sign_up_phone_number_cubit.dart';

import '../../domain/use_case/get_country_place_holder_phone_number_use_case.dart';

class SignUpPhoneNumberScreen extends StatelessWidget {
  const SignUpPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpPhoneNumberCubit>(
      create:
          (context) => SignUpPhoneNumberCubit(
            context.read<ValidatePhoneNumberUseCase>(),
            context.read<SignUpPhoneNumberUseCase>(),
            context.read<GetCountryPlaceHolderPhoneNumberUseCase>(),
          ),
      child: SignUpPhoneNumberView(),
    );
  }
}
