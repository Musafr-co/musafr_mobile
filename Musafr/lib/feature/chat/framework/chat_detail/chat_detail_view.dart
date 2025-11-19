import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/framework/chat_detail/view_modal/chat_detail_cubit.dart';
import 'package:musafr/feature/chat/framework/chat_detail/view_modal/chat_detail_state.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../../core/view/widgets/top_handle_view/top_handle_view.dart';
import '../../domain/entity/chat_detail.dart';
import '../widget/SendMessageToChatView.dart';

class ChatDetailView extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        LoadingDialogListener<ChatDetailCubit, ChatDetailState>(
          isLoading: (s) => s.screenState is UiLoading,
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),
        ErrorDialogListener<ChatDetailCubit, ChatDetailState>(
          screenStateSelector: (s) => s.screenState,
          shouldShowError:
              (s) =>
                  s.screenState is UiError &&
                  ((s.screenState as UiError).data != null),
          errorMessageSelector:
              (s) =>
                  s.screenState is UiError
                      ? (s.screenState as UiError).message
                      : '',
          onAcknowledge: () => context.read<ChatDetailCubit>().onAcknowledge(),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child:
              BlocSelector<ChatDetailCubit, ChatDetailState, UiState<Chat?>?>(
                selector: (state) => state.chatState,
                builder: (context, state) {
                  return Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(alignment: Alignment.center, child: TopHandle()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state?.data?.title ?? "Planing a trip",
                            style: TextStyle(
                              fontSize: 20,
                              color: dividerColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: pillBackgroundColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                spacing: 8,
                                children: [
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: pillTextColor,
                                  ),
                                  Text(
                                    "Go to bag",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: pillTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      state?.data?.messages != null
                          ? Expanded(
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: state?.data?.messages?.length ?? 0,
                              itemBuilder: (context, index) {
                                final message = state?.data?.messages?[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 10,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: messageFromUserColor,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:  Radius.circular(20), bottomRight: Radius.zero, bottomLeft:  Radius.circular(20)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(16,12,16,12),
                                            child: Text(
                                              message?.senderRequest?.toString() ?? "",
                                              style: TextStyle(fontSize: 14, color: titleTextColor, ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 10,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: messageFromServerColor,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight:  Radius.circular(20), bottomLeft: Radius.zero, bottomRight:  Radius.circular(20)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(16,12,16,12),
                                            child: message?.deepSeekStatus == 1? Text(
                                              message?.deepSeekResponse?.toString() ?? "",
                                              style: TextStyle(fontSize: 14, color: titleTextColor, ),
                                            ): CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                          : Expanded(
                            child: Image(
                              image: AssetImage(
                                'assets/images/chat_detail_placeholder.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                      BlocSelector<ChatDetailCubit, ChatDetailState, String?>(
                        selector: (state) => state.currentMessage,
                        builder: (context, state) {
                          return SendMessageToChatEditText(
                            value: UiSuccess(data: state ?? ""),
                            onTextUpdate: (String value) {
                              context
                                  .read<ChatDetailCubit>()
                                  .updateCurrentMessage(value);
                            },
                            onMessageSend: () {
                              context.read<ChatDetailCubit>().sendMessage();
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
