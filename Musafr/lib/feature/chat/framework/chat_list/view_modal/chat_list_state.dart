import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../../user/domain/modal/user_modal.dart';

class ChatListState {
  UiState<List<Chat>> chats;
  bool navigateToNotification;
  bool showNewChat;
  bool navigateToFav;
  int? selectedChat;

  ChatListState({
    this.chats = const UiLoading(data: []),
    this.navigateToNotification = false,
    this.showNewChat = false,
    this.navigateToFav = false,
    this.selectedChat,
  });

  ChatListState copyWith({
    UiState<List<Chat>>? chats,
    bool? navigateToNotification,
    bool? navigateToFav,
    UiState<UserModal?>? currentUser,
    int? selectedChat,
    bool? showNewChat,
  }) {
    return ChatListState(
      chats: chats ?? this.chats,
      navigateToNotification:
          navigateToNotification ?? this.navigateToNotification,
      navigateToFav: navigateToFav ?? this.navigateToFav,
      selectedChat: selectedChat ?? this.selectedChat,
      showNewChat: showNewChat ?? this.showNewChat,
    );
  }
}
