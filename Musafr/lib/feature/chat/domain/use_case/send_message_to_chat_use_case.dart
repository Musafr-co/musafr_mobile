import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';
import '../repository/chat_repository.dart';

class SendMessageToChatUseCase {
  final ChatRepository _chatRepository;

  SendMessageToChatUseCase(this._chatRepository);

  Future<DomainResponse<Chat>> invoke(String message, int chatId) async {
    return await _chatRepository.sendMessage(message, chatId);
  }
}
