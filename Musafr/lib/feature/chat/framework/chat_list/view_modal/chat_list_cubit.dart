import 'package:bloc/bloc.dart';

import '../../../../../core/domain/model/domain_response.dart';
import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/use_case/get_user_chat_list_use_case.dart';
import 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final GetUserChatListUseCase _getUserChatListUseCase;

  ChatListCubit(this._getUserChatListUseCase) : super(ChatListState());

  void getChatList() async {
    emit(state.copyWith(chats: UiLoading(data: null)));
    final result = await _getUserChatListUseCase.invoke();
    switch (result) {
      case DomainSuccess():
        {
          emit(state.copyWith(chats: UiSuccess(data: result.data ?? [])));
          return;
        }
      case DomainFailure(:final error):
        {
          emit(state.copyWith(chats: UiError(message: error, data: null)));
          return;
        }
    }
  }

  void createNewChat() async {
    emit(state.copyWith(showNewChat: true));
  }

  void selectChat(int chatId){
    emit(state.copyWith(selectedChat: chatId));
    resetNavigation();
  }

  void resetError() {
    emit(state.copyWith(chats: UiSuccess(data: [])));
  }

  void resetNavigation() {
    emit(
      state.copyWith(
        navigateToFav: false,
        navigateToNotification: false,
        selectedChat: 0,
        showNewChat: false,
      ),
    );
  }
}
