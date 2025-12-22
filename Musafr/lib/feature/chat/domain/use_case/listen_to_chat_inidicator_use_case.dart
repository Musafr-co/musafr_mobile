import 'dart:async';
import 'dart:io';

import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';
import '../repository/chat_repository.dart';

class ListenToChatIndicatorUseCase {
  final ChatRepository _chatRepository;

  ListenToChatIndicatorUseCase(this._chatRepository);

  Stream<DomainResponse<Chat?>> invoke(int id) async* {
    bool isFinished = false;

    while (!isFinished) {
      final response = await _chatRepository.getStatusChatById(id);

      yield response;

      switch (response) {
        case DomainSuccess():
          final chat = response.data;
          if (chat != null && chat.messages?.last?.isPollingNeeded == false) {
            isFinished = true;
            break;

          }
          else{
            await Future.delayed(Duration(seconds: 2));
          }

        case DomainFailure():
          isFinished = true;
          break;
      }

      // Add polling interval to prevent spam requests
      if (!isFinished) {
        await Future.delayed(Duration(seconds: 1));
      }
    }
  }
}