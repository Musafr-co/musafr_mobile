import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_cubit.dart';

import '../../domain/use_case/get_user_chat_list_use_case.dart';
import 'chat_list_view.dart';

class ChatListScreen extends StatefulWidget {
  BuildContext ctx;

  ChatListScreen({super.key, required this.ctx});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatListCubit>(
      create:
          (context) => ChatListCubit(context.read<GetUserChatListUseCase>()),
      child: ChatListView(ctx: widget.ctx),
    );
  }
}
