import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/feature/chat/data/modal/chat_dto.dart';
import 'package:musafr/feature/chat/data/remote/source/chat_source.dart';

class ChatRemoteSourceImpl extends ChatRemoteSource {
  @override
  Future<NetworkResponse<ChatDto>> getChatById(int id) {
    // TODO: implement getChatById
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<List<ChatDto>>> getUserChats() {
    // TODO: implement getUserChats
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<ChatDto>> createNewChat() {
    // TODO: implement createNewChat
    throw UnimplementedError();
  }
}
