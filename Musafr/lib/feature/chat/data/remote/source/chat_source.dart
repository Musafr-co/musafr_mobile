

import '../../../../../core/data/model/network_response.dart';
import '../../modal/chat_dto.dart';

abstract class ChatRemoteSource{
  Future<NetworkResponse<List<ChatDto>>> getUserChats();
  Future<NetworkResponse<ChatDto>> getChatById(int id);
  Future<NetworkResponse<ChatDto>> createNewChat();
}