import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_cubit.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_state.dart';
import 'package:musafr/feature/chat/framework/widget/chat_list_item.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../user/view/user_top_bar/logged_in_user_top_bar.dart';
import '../../domain/entity/chat_detail.dart';
import '../widget/create_a_new_trip_button.dart';

class ChatListView extends StatefulWidget {
  const ChatListView({super.key});

  @override
  State<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends State<ChatListView> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatListCubit>().getChatList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        LoadingDialogListener<ChatListCubit, ChatListState>(
          isLoading: (s) {
            return  s.chats is UiLoading;
          },
          loadingBuilder:
              (_) => const Center(child: CircularProgressIndicator()),
        ),
        BlocListener<ChatListCubit, ChatListState>(
          listenWhen:
              (previous, current) =>
                  previous.navigateToFav != current.navigateToFav,
          listener: (context, state) {
            if (state.navigateToFav) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placeholder()),
              );
              context.read<ChatListCubit>().resetNavigation();
            }
          },
        ),
        BlocListener<ChatListCubit, ChatListState>(
          listenWhen:
              (previous, current) =>
                  previous.navigateToNotification !=
                  current.navigateToNotification,
          listener: (context, state) {
            if (state.navigateToNotification) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placeholder()),
              );
              context.read<ChatListCubit>().resetNavigation();
            }
          },
        ),
        BlocListener<ChatListCubit, ChatListState>(
          listenWhen:
              (previous, current) =>
                  previous.selectedChat != current.selectedChat,
          listener: (context, state) {
            if (state.selectedChat != null && state.selectedChat! > 0) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Placeholder()),
              );
              context.read<ChatListCubit>().resetNavigation();
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
            child: Stack(
              children: [
                Column(
                  spacing: 16,
                  children: [
                    LoggedInUserTopBar(),
                    BlocSelector<
                      ChatListCubit,
                      ChatListState,
                      UiState<List<Chat?>>
                    >(
                      selector: (state) => state.chats,
                      builder: (context, state) {
                        if (state.data?.isEmpty ?? true) {
                          return SizedBox();
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.data!.length + 1,
                            itemBuilder: (context, index) {
                              if (index == state.data!.length) {
                                return SizedBox(height: 60);
                              }
                              return ChatListItem(
                                chat: state.data!.elementAt(index)!,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 4, 8, 8),
                    child: CreateANewTripButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
