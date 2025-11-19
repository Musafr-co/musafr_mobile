import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../../../../../core/view/ui_state/ui_state.dart';

class ChatDetailState {
  UiState<bool>? screenState;
  UiState<Chat?>? chatState;
  bool selectedDetails;
  int selectedChatId;
  String? currentMessage;

  ChatDetailState({
    this.screenState,
    this.chatState,
    this.currentMessage,
    required this.selectedDetails,
    required this.selectedChatId,
  });

  ChatDetailState copyWith({
    UiState<bool>? screenState,
    UiState<Chat?>? chatState,
    bool? selectedDetails,
    int? selectedChatId,
    String? currentMessage,
  }) {
    return ChatDetailState(
      screenState: screenState ?? this.screenState,
      chatState: chatState ?? this.chatState,
      selectedDetails: selectedDetails ?? this.selectedDetails,
      selectedChatId: selectedChatId ?? this.selectedChatId,
      currentMessage: currentMessage ?? this.currentMessage,
    );
  }
}
