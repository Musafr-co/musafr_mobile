import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/domain/use_case/listen_to_chat_inidicator_use_case.dart';
import 'package:musafr/feature/chat/framework/chat_detail/chat_detail_view.dart';
import 'package:musafr/feature/chat/framework/chat_detail/view_modal/chat_detail_cubit.dart';

import '../../domain/use_case/create_a_new_chat_use_case.dart';
import '../../domain/use_case/get_specific_chat_detail_use_case.dart';

void showChatBottomSheet(BuildContext context, int chatId) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    barrierColor: Colors.transparent,
    useSafeArea: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(45),
    ),
    builder: (BuildContext context) {
      final double screenHeight = MediaQuery.of(context).size.height * 1;

      return SizedBox(
        height: screenHeight,
        child: ChatDetailScreen(chatId: chatId),
      );
    },
  );
}

class ChatDetailScreen extends StatelessWidget {
  final int chatId;

  const ChatDetailScreen({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatDetailCubit>(
      create: (context) => ChatDetailCubit(context.read<GetSpecificChatDetailUseCase>(),
          context.read<SendMessageToChatUseCase>(), context.read<ListenToChatIndicatorUseCase>(), chatId),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ChatDetailView(),
      ),
    );
  }
}
