import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/user/data/repository/user_repository_impl.dart';
import 'package:musafr/feature/user/data/source/remote/source/user_remote_source.dart';
import 'package:musafr/feature/user/domain/repository/user_repository.dart';
import 'package:musafr/feature/user/domain/use_case/get_current_user_use_case.dart';
import 'package:musafr/feature/user/domain/use_case/save_current_user_use_case.dart';

import '../data/source/local/source/local_source.dart';
import '../data/source/local/source/local_source_impl.dart';
import '../data/source/remote/source/user_remote_source_impl.dart';

final userDi = [
  RepositoryProvider<UserLocalSource>(
    create: (context) => UserLocalSourceImpl(),
  ),
  RepositoryProvider<UserRemoteSource>(
    create: (context) => UserRemoteSourceImpl(),
  ),
  RepositoryProvider<UserRepository>(
    create:
        (context) => UserRepositoryImpl(
          userLocalSource: context.read<UserLocalSource>(),
          userRemoteSource: context.read<UserRemoteSource>(),
        ),
  ),
  RepositoryProvider<GetCurrentUserUseCase>(
    create: (context) => GetCurrentUserUseCase(context.read<UserRepository>()),
  ),
  RepositoryProvider<SaveCurrentUserUseCase>(
    create: (context) => SaveCurrentUserUseCase(context.read<UserRepository>()),
  ),
];
