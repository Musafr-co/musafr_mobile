import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/timer/data/timer_repository_impl.dart';
import 'package:musafr/feature/timer/domain/use_case/get_timer_time_use_case.dart';
import 'package:musafr/feature/timer/domain/use_case/start_timer_use_case.dart';
import 'package:musafr/feature/timer/domain/use_case/stop_timer_use_case.dart';

import '../domain/repository/timer_repository.dart';

final timerDi = [
  RepositoryProvider<TimerRepository>(
    create: (context) => TimerRepositoryImpl(),
  ),
  RepositoryProvider<GetTimerTimeUseCase>(
    create: (context) => GetTimerTimeUseCase(context.read<TimerRepository>()),
  ),
  RepositoryProvider<StartTimerUseCase>(
    create: (context) => StartTimerUseCase(context.read<TimerRepository>()),
  ),
  RepositoryProvider<StopTimerUseCase>(
    create: (context) => StopTimerUseCase(context.read<TimerRepository>()),
  ),
];
