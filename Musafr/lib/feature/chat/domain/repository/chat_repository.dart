import 'package:musafr/feature/chat/domain/entity/additional_message.dart';

import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';

abstract class ChatRepository {
  Future<DomainResponse<List<Chat>>> getUserChats();

  Future<DomainResponse<Chat>> getChatById(int id);

  Future<DomainResponse<Chat>> createNewChat();

  Future<DomainResponse<Chat>> sendMessage(String message, int chatId);

  Future<DomainResponse<Chat>> sendUserCustomMessage(
    List<AdditionalMessage> messages,
    int chatId,
  );
}
