import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';
import 'package:musafr/feature/chat/domain/use_case/create_a_new_chat_use_case.dart';

import '../../../../../core/domain/model/domain_response.dart';
import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/use_case/get_specific_chat_detail_use_case.dart';
import '../../../domain/use_case/listen_to_chat_inidicator_use_case.dart';
import '../../../../chat/domain/entity/hotel_info.dart';
import '../../../../chat/domain/entity/message_metadata.dart';
import 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  final GetSpecificChatDetailUseCase _getChatDetailUseCase;
  final SendMessageToChatUseCase _sendMessageToChatUseCase;
  final ListenToChatIndicatorUseCase _listenToChatIndicatorUseCase;
  int selectedChatId;
  StreamSubscription? _subscription = null;

  ChatDetailCubit(
    this._getChatDetailUseCase,
    this._sendMessageToChatUseCase,
    this._listenToChatIndicatorUseCase,
    this.selectedChatId,
  ) : super(
        ChatDetailState(
          selectedChatId: selectedChatId,
          selectedDetails: false,
          canSendMessage: false,
          navigateToLatest: false,
          currentMessageState: UiIdle(data: ""),
        ),
      ) {
    getChatDetail();
  }

  void getChatDetail() async {
    emit(state.copyWith(chatState: UiLoading(data: state.chatState?.data)));
    if (selectedChatId < 1) {
      return emit(state.copyWith(chatState: UiSuccess(data: Chat(id: 0))));
    }
    final result = await _getChatDetailUseCase.invoke(selectedChatId);
    switch (result) {
      case DomainSuccess():
        {
          emit(
            state.copyWith(
              chatState: UiSuccess(data: result.data),
              navigateToLatest: true,
            ),
          );
          return;
        }
      case DomainFailure(:final error):
        {
          emit(state.copyWith(chatState: UiError(message: error, data: null)));
          return;
        }
    }
  }

  void sendMessage() async {
    if (state.currentMessageState == UiError || state.chatState?.data?.messages?.last?.isPollingNeeded == true) {
      return;
    }

    emit(
      state.copyWith(
        chatState: UiLoading(data: state.chatState?.data),
        currentMessageState: UiLoading(
          data: state.currentMessageState?.data ?? "",
        ),
      ),
    );
    final result = await _sendMessageToChatUseCase.invoke(
      state.currentMessageState?.data ?? "",
      selectedChatId,
    );
    switch (result) {
      case DomainSuccess():
        {
          selectedChatId = result.data?.id ?? 0;
          final messages = state.chatState?.data?.messages ?? [];
          if (result.data?.messages != null) {
            messages.add(result.data!.messages!.first);
            if (result.data?.messages?.last?.isPollingNeeded == true) {
              emit(
                state.copyWith(
                  currentMessageState: UiError(
                    data: "",
                    message: "Please Wait for the response",
                  ),
                  navigateToLatest: true,
                ),
              );
              listenToChatForId(selectedChatId);
            }
          }
          final data = state.chatState?.data;
          data?.messages = messages;
          emit(
            state.copyWith(
              chatState: UiSuccess(data: data),
              currentMessageState: UiIdle(data: ""),
            ),
          );
        }
      case DomainFailure(:final error):
        {
          emit(state.copyWith(chatState: UiError(message: error, data: null)));
        }
    }
  }

  void resetNavigation() {
    emit(state.copyWith(navigateToLatest: false));
  }

  void updateCurrentMessage(String message) {
    emit(state.copyWith(currentMessageState: UiSuccess(data: message)));
  }

  void onAcknowledge() {}

  void listenToChatForId(int selectedChatId) {
    _subscription = _listenToChatIndicatorUseCase.invoke(selectedChatId).listen(
      (event) {
        switch (event) {
          case DomainSuccess():
            {
              if (state.chatState?.data?.messages?.last?.isPollingNeeded ==
                  true) {
                getChatDetail();
                _subscription?.cancel();
              }
            }
          case DomainFailure(:final error):
            {
              emit(
                state.copyWith(
                  chatState: UiError(message: error, data: null),
                  currentMessageState: UiSuccess(data: ""),
                ),
              );
              return;
            }
        }
      },
    );
  }
  void onHotelSelected(HotelInfo hotel, MessageMetadata? metadata) {
    if (hotel.hotelId != null) {
      emit(
        state.copyWith(
          showHotelOffersEvent: HotelOffersEvent(
            hotelId: hotel.hotelId!,
            checkInDate: metadata?.checkInDate ?? "",
            guests: metadata?.guestsCount ?? 1,
            roomQuantity: metadata?.roomsQuantity ?? 1,
          ),
        ),
      );
    }
  }

  void resetShowHotelOffersEvent() {
    emit(state.copyWith(showHotelOffersEvent: null));
  }
}
