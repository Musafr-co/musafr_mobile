import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/chat/data/modal/chat_dto.dart';
import 'package:musafr/feature/chat/data/remote/source/chat_source.dart';

class ChatRemoteSourceImpl extends ChatRemoteSource {
  final ApiClient apiClient;
  ChatRemoteSourceImpl(this.apiClient);
  @override
  Future<NetworkResponse<ChatDto>> getChatById(int id) {
    // TODO: implement getChatById
    throw UnimplementedError();
  }

  @override
  Future<NetworkResponse<List<ChatDto>>> getUserChats() async {
    throw UnimplementedError();
    // final response = await apiClient.post(
    //   "api/v1/auth/chat",
    // );
    // if (response.statusCode! >= 200 && response.statusCode! < 300) {
    //   try {
    //     final user = ChatDto.fromJson(response.data);
    //     return NetworkSuccess<UserDto>(user, "Success", response.statusCode!);
    //   } catch (exception) {
    //     return NetworkException(exception as Exception);
    //   }
    // } else {
    //   return NetworkFailure(error: response.data, data: null);
    // }
  }

  @override
  Future<NetworkResponse<ChatDto>> createNewChat() {
    // TODO: implement createNewChat
    throw UnimplementedError();
  }
}
