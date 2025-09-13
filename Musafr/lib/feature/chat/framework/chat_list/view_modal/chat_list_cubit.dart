import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:musafr/feature/chat/domain/use_case/create_a_new_chat_use_case.dart';

import '../../../../../core/domain/model/domain_response.dart';
import '../../../../../core/view/ui_state/ui_state.dart';
import '../../../domain/use_case/get_user_chat_list_use_case.dart';
import 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  final GetUserChatListUseCase _getUserChatListUseCase;
  final CreateANewChatUseCase _createANewChatUseCase;

  ChatListCubit(this._getUserChatListUseCase, this._createANewChatUseCase)
    : super(ChatListState()) ;

  void getChatList() async {
    emit(state.copyWith(chats: UiLoading(data: null)));
    final result = await _getUserChatListUseCase.invoke();
    switch (result) {
      case DomainSuccess():
        {
          emit(state.copyWith(chats: UiSuccess(data: result.data)));
          return;
        }
      case DomainFailure(:final error):
        {
          emit(state.copyWith(chats: UiError(message: error, data: null)));
          return;
        }
    }
  }
@override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
  void createNewChat() async {
    final result = await _createANewChatUseCase.invoke();
    switch (result) {
      case DomainSuccess():
        {
          emit(state.copyWith(selectedChat: Random().nextInt(1000000000)));
          return;
        }
      case DomainFailure(:final error):
        {
          emit(state.copyWith(chats: UiError(message: error, data: null)));
          return;
        }
    }
  }

  void resetNavigation() {
    emit(
      state.copyWith(
        navigateToFav: false,
        navigateToNotification: false,
        selectedChat: null,
      ),
    );
  }
}
