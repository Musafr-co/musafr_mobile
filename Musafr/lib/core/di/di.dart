import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/validator/di/validate_di.dart';

import '../../feature/authentication/di/auth_di.dart';
import '../../feature/chat/di/chat_di.dart';
import '../../feature/phone_number/di/phone_number_di.dart';
import '../../feature/timer/di/timer_di.dart';
import '../../feature/user/di/user_di.dart';

Widget appWithDependencies(Widget mainApplication) {
  return MultiRepositoryProvider(
    providers: [
      ...userDi,
      ...validateDi,
      ...authRepositoryProvider,
      ...phoneNumberDi,
      ...timerDi,
      ...chatDi,

    ],
    child: mainApplication,
  );
}
