import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_cubit.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_state.dart';
import 'package:musafr/feature/chat/framework/widget/chat_list_item.dart';

import '../../../../core/view/color/color_mapper.dart';
import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/dialogs/error_dialog.dart';
import '../../../../core/view/widgets/dialogs/loading/loading_dialog.dart';
import '../../../user/view/user_top_bar/logged_in_user_top_bar.dart';
import '../../domain/entity/chat_detail.dart';
import '../chat_detail/chat_detail_screen.dart';
import '../widget/create_a_new_trip_button.dart';

class ChatListView extends StatefulWidget {
  BuildContext ctx;

  ChatListView({super.key, required this.ctx});

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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: statusBarHeight + 300,
              child: Image(
                image: AssetImage('assets/images/page_back_cover.png'),
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: statusBarHeight + 300,
              child: Container(
                width: double.infinity,
                height: statusBarHeight + 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      rgba(255, 255, 255, 0.7),
                      rgba(255, 255, 255, 1),
                      rgba(255, 255, 255, 1),
                      rgba(255, 255, 255, 1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: statusBarHeight),
              child: MultiBlocListener(
                listeners: [
                  LoadingDialogListener<ChatListCubit, ChatListState>(
                    isLoading: (s) {
                      return s.chats is UiLoading;
                    },
                    loadingBuilder:
                        (_) => const Center(child: CircularProgressIndicator()),
                  ),
                  ErrorDialogListener<ChatListCubit, ChatListState>(
                    screenStateSelector: (s) => s.chats,
                    shouldShowError: (s) => s.chats is UiError,
                    errorMessageSelector:
                        (s) =>
                            s.chats is UiError
                                ? (s.chats as UiError).message
                                : '',
                    onAcknowledge:
                        () => context.read<ChatListCubit>().resetError(),
                  ),
                  BlocListener<ChatListCubit, ChatListState>(
                    listenWhen:
                        (previous, current) =>
                            previous.navigateToFav != current.navigateToFav,
                    listener: (context, state) {
                      if (state.navigateToFav) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
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
                          MaterialPageRoute(
                            builder: (context) => const Placeholder(),
                          ),
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
                      if (state.selectedChat != null &&
                          state.selectedChat! > 0) {
                        showChatBottomSheet(
                          widget.ctx,
                          state.selectedChat ?? 0,
                        );
                      }
                    },
                  ),
                  BlocListener<ChatListCubit, ChatListState>(
                    listenWhen:
                        (previous, current) =>
                            previous.showNewChat != current.showNewChat,
                    listener: (context, state) {
                      if (state.showNewChat) {
                        showChatBottomSheet(widget.ctx, 0);
                        context.read<ChatListCubit>().resetNavigation();
                      }
                    },
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
                  child: Stack(
                    children: [
                      Column(
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
                                return SvgPicture.asset(
                                  "assets/icons/chat_list_placeholder.svg",
                                );
                              }
                              return Expanded(
                                child: ListView.builder(
                                  itemCount: state.data!.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == state.data!.length) {
                                      return const SizedBox(height: 60);
                                    }
                                    return GestureDetector(
                                      onTap:
                                          () => context
                                              .read<ChatListCubit>()
                                              .selectChat(
                                                state.data!
                                                    .elementAt(index)!
                                                    .id,
                                              ),
                                      child: ChatListItem(
                                        chat: state.data!.elementAt(index)!,
                                      ),
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
          ],
        ),
      ),
    );
  }
}
