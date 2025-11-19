import 'package:musafr/feature/chat/domain/repository/chat_repository.dart';

import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';

class SendMessageToChatUseCase {
  final ChatRepository _chatRepository;

  SendMessageToChatUseCase(this._chatRepository);

  Future<DomainResponse<Chat?>> invoke(String message, int chatId) {
    return _chatRepository.sendMessageToChat(message, chatId);
  }
}
