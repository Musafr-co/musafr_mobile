import 'package:bloc/bloc.dart';
import 'package:musafr/feature/chat/domain/use_case/send_message_to_chat_use_case.dart';

import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/use_case/get_specific_chat_detail_use_case.dart';
import 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  final GetSpecificChatDetailUseCase _getChatDetailUseCase;
  final SendMessageToChatUseCase _sendMessageToChatUseCase;
  final int selectedChatId;

  ChatDetailCubit(
    this._getChatDetailUseCase,
    this._sendMessageToChatUseCase,
    this.selectedChatId,
  ) : super(
        ChatDetailState(selectedChatId: selectedChatId, selectedDetails: false),
      );

  void getChatDetail() async {
    emit(state.copyWith(chatState: UiLoading(data: state.chatState?.data)));
    await _getChatDetailUseCase.invoke(selectedChatId);
    emit(state.copyWith(chatState: UiSuccess(data: state.chatState?.data)));
  }

  void sendMessage(String message) async {
    emit(state.copyWith(chatState: UiLoading(data: state.chatState?.data)));
    await _sendMessageToChatUseCase.invoke(message, selectedChatId);
    emit(state.copyWith(chatState: UiSuccess(data: state.chatState?.data)));
  }
}
