import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/data/remote/source/chat_source.dart';
import 'package:musafr/feature/chat/data/repository/chat_repository_impl.dart';
import 'package:musafr/feature/chat/domain/repository/chat_repository.dart';
import 'package:musafr/feature/chat/domain/use_case/create_a_new_chat_use_case.dart';
import 'package:musafr/feature/chat/domain/use_case/get_specific_chat_detail_use_case.dart';
import 'package:musafr/feature/chat/domain/use_case/get_user_chat_list_use_case.dart';

import '../data/remote/source/chat_source_impl.dart';

final chatDi = [
  RepositoryProvider<ChatRemoteSource>(
    create: (context) => ChatRemoteSourceImpl(),
  ),
  RepositoryProvider<ChatRepository>(
    create: (context) => ChatRepositoryImpl(context.read<ChatRemoteSource>()),
  ),
  RepositoryProvider<GetUserChatListUseCase>(
    create: (context) => GetUserChatListUseCase(context.read<ChatRepository>()),
  ),
  RepositoryProvider<GetSpecificChatDetailUseCase>(
    create:
        (context) =>
            GetSpecificChatDetailUseCase(context.read<ChatRepository>()),
  ),
  RepositoryProvider<CreateANewChatUseCase>(
    create: (context) => CreateANewChatUseCase(context.read<ChatRepository>()),
  ),
];
