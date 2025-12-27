import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../../../../../core/view/ui_state/ui_state.dart';

class HotelOffersEvent {
  final String hotelId;
  final String checkInDate;
  final int guests;
  final int roomQuantity;

  HotelOffersEvent({
    required this.hotelId,
    required this.checkInDate,
    required this.guests,
    required this.roomQuantity,
  });
}

class ChatDetailState {
  UiState<bool>? screenState;
  UiState<Chat?>? chatState;
  bool selectedDetails;
  int selectedChatId;
  UiState<String>? currentMessageState;
  bool canSendMessage = true;
  bool navigateToLatest = false;
  HotelOffersEvent? showHotelOffersEvent;

  ChatDetailState({
    this.screenState,
    this.chatState,
    required this.currentMessageState,
    required this.selectedDetails,
    required this.selectedChatId,
    required this.canSendMessage,
    required this.navigateToLatest,
    this.showHotelOffersEvent,
  });

  ChatDetailState copyWith({
    UiState<bool>? screenState,
    UiState<Chat?>? chatState,
    bool? selectedDetails,
    int? selectedChatId,
    UiState<String>? currentMessageState,
    bool? canSendMessage,
    bool? navigateToLatest,
    HotelOffersEvent? showHotelOffersEvent,
  }) {
    return ChatDetailState(
      screenState: screenState ?? this.screenState,
      chatState: chatState ?? this.chatState,
      selectedDetails: selectedDetails ?? this.selectedDetails,
      selectedChatId: selectedChatId ?? this.selectedChatId,
      currentMessageState: currentMessageState ?? this.currentMessageState,
      canSendMessage: canSendMessage ?? this.canSendMessage,
      navigateToLatest: navigateToLatest ?? this.navigateToLatest,
      showHotelOffersEvent: showHotelOffersEvent ?? this.showHotelOffersEvent,
    );
  }
}
