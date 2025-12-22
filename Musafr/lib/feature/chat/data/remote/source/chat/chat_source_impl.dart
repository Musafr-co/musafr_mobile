import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/chat/data/modal/chat_dto.dart';
import 'package:musafr/feature/chat/data/remote/source/chat/chat_source.dart';

class ChatRemoteSourceImpl extends ChatRemoteSource {
  final ApiClient apiClient;

  ChatRemoteSourceImpl(this.apiClient);

  @override
  Future<NetworkResponse<ChatDto>> getChatById(int id) async {
    final response = await apiClient.get("api/v1/chat/${id}");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final chat = ChatDto.fromJson(response.data['data']['result']);
        return NetworkSuccess<ChatDto>(chat, "Success", response.statusCode!);
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(
        error: response.statusMessage ?? response.data,
        data: null,
      );
    }
  }


  @override
  Future<NetworkResponse<ChatDto>> getStatusById(int id) async {
    final response = await apiClient.get("api/v1/chat/$id/status");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final chat = ChatDto.fromJson(response.data['data']['result']);
        return NetworkSuccess<ChatDto>(chat, "Success", response.statusCode!);
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(
        error: response.statusMessage ?? response.data,
        data: null,
      );
    }
  }

  @override
  Future<NetworkResponse<List<ChatDto>>> getUserChats() async {
    final response = await apiClient.get("api/v1/chat");
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final chats = List<ChatDto>.from(
          response.data['data']['result'].map((e) => ChatDto.fromJson(e??{})),
        ).toList(growable: false);
        return NetworkSuccess<List<ChatDto>>(
          chats,
          "Success",
          response.statusCode!,
        );
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(
        error: response.statusMessage ?? response.data,
        data: response.statusCode == 400 ? [] : null,
      );
    }
  }

  @override
  Future<NetworkResponse<ChatDto>> sendMessageToChat(
    String message,
    int? chatId,
  ) async {
    final response = await apiClient.post(
      "api/v1/chat",
      data: {"message": message, 'chatId': chatId ?? 0},
    );
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final chats = ChatDto.fromJson(response.data['data']['result']);
        return NetworkSuccess<ChatDto>(chats, "Success", response.statusCode!);
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(
        error: response.statusMessage ?? response.data,
        data: null,
      );
    }
  }
}
