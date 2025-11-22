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
import '../widget/message_detail_view.dart';

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
        BlocListener<ChatDetailCubit, ChatDetailState>(
          listenWhen:
              (previous, current) =>
                  previous.navigateToLatest != current.navigateToLatest,
          listener: (context, state) {
            if (state.navigateToLatest) {
              Future.delayed(const Duration(milliseconds: 500), () {
                if (_scrollController.hasClients) {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                }
              });
              context.read<ChatDetailCubit>().resetNavigation();
            }
          },
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
                                if (message == null) return Container();
                                return MessageDetailView(message: message);
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
                      BlocSelector<
                        ChatDetailCubit,
                        ChatDetailState,
                        UiState<String>
                      >(
                        selector:
                            (state) => state.currentMessageState ?? UiLoading(),
                        builder: (context, state) {
                          return SendMessageToChatEditText(
                            value: state,
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
