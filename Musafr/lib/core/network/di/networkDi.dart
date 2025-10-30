import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/core/network/data/client/api_client.dart';

import '../../../feature/authentication/data/local/source/share_preference/source.dart';
import '../../../feature/authentication/data/local/source/share_preference/source_impl.dart';

final networkDi = [
  RepositoryProvider<AuthPreferenceSource>(
    create: (context) => AuthSharePreferenceImpl(),
  ),
  RepositoryProvider<ApiClient>(
    create: (context) => ApiClient(context.read<AuthPreferenceSource>()),
  ),
];
