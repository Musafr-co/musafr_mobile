import 'package:bloc/bloc.dart';
import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';
import 'package:musafr/feature/chat/domain/use_case/create_a_new_chat_use_case.dart';

import '../../../../../core/domain/model/domain_response.dart';
import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/use_case/get_specific_chat_detail_use_case.dart';
import 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  final GetSpecificChatDetailUseCase _getChatDetailUseCase;
  final SendMessageToChatUseCase _sendMessageToChatUseCase;
  int selectedChatId;

  ChatDetailCubit(
    this._getChatDetailUseCase,
    this._sendMessageToChatUseCase,
    this.selectedChatId,
  ) : super(
        ChatDetailState(selectedChatId: selectedChatId, selectedDetails: false),
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
          emit(state.copyWith(chatState: UiSuccess(data: result.data)));
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
    emit(state.copyWith(chatState: UiLoading(data: state.chatState?.data)));
    final result = await _sendMessageToChatUseCase.invoke(
      state.currentMessage ?? "",
      selectedChatId,
    );
    switch (result) {
      case DomainSuccess():
        {
          final messages = state.chatState?.data?.messages ?? [];
          if (result.data?.messages != null) {
            messages.add(result.data!.messages!.first);
          }
          final data = state.chatState?.data;
          data?.messages = messages;
          emit(
            state.copyWith(
              chatState: UiSuccess(data: data),
              currentMessage: "",
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

  void updateCurrentMessage(String message) {
    emit(state.copyWith(currentMessage: message));
  }

  void onAcknowledge() {}
}
