import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../../../../../core/view/ui_state/ui_state.dart';

class ChatDetailState {
  UiState<bool>? screenState;
  UiState<Chat?>? chatState;
  bool selectedDetails;
  int selectedChatId;
  UiState<String>? currentMessageState;
  bool canSendMessage = true;
  bool navigateToLatest = false;

  ChatDetailState({
    this.screenState,
    this.chatState,
    required this.currentMessageState,
    required this.selectedDetails,
    required this.selectedChatId,
    required this.canSendMessage,
    required this.navigateToLatest,
  });

  ChatDetailState copyWith({
    UiState<bool>? screenState,
    UiState<Chat?>? chatState,
    bool? selectedDetails,
    int? selectedChatId,
    UiState<String>? currentMessageState,
    bool? canSendMessage,
    bool? navigateToLatest,
  }) {
    return ChatDetailState(
      screenState: screenState ?? this.screenState,
      chatState: chatState ?? this.chatState,
      selectedDetails: selectedDetails ?? this.selectedDetails,
      selectedChatId: selectedChatId ?? this.selectedChatId,
      currentMessageState: currentMessageState ?? this.currentMessageState,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      navigateToLatest: navigateToLatest ?? this.navigateToLatest,
    );
  }
}
