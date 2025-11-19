import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/chat/data/mapper/chat_mapper.dart';
import 'package:musafr/feature/chat/domain/entity/additional_message.dart';
import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';
import 'package:musafr/feature/chat/domain/repository/chat_repository.dart';

import '../remote/source/chat_source.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteSource _remoteSource;

  ChatRepositoryImpl(this._remoteSource);

  @override
  Future<DomainResponse<Chat>> getChatById(int id) async {
    try {
      final response = await _remoteSource.getChatById(id);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            return DomainSuccess<Chat>(
              ChatMapper.toDomain(domainResponse.data),
            )
            as DomainResponse<Chat>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
            as DomainResponse<Chat>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }

  @override
  Future<DomainResponse<List<Chat>?>> getUserChats() async {
    try {
      final response = await _remoteSource.getUserChats();
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            return DomainSuccess<List<Chat>>(
                (domainResponse.data as List<dynamic>)
                    .map((e) => ChatMapper.toDomain(e))
                    .toList()
                )
                as DomainResponse<List<Chat>?>;
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
                as DomainResponse<List<Chat>?>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: []);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: []);
    }
  }

  @override
  Future<DomainResponse<Chat?>> sendMessageToChat(
    String message,
    int chatId,
  ) async {
    try {
      final response = await _remoteSource.sendMessageToChat(message, chatId);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            return DomainSuccess<Chat>(
              ChatMapper.toDomain(domainResponse.data),
            );
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
                as DomainResponse<Chat?>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }


  @override
  Future<DomainResponse<Chat>> sendUserCustomMessage(
    List<AdditionalMessage> messages,
    int chatId,
  ) {
    // TODO: implement sendUserCustomMessage
    throw UnimplementedError();
  }

  @override
  Future<DomainResponse<Chat?>> getStatusChatById(int id) async {
    try {
      final response = await _remoteSource.getStatusById(id);
      DomainResponse domainResponse = response.toDomainResponse();
      switch (domainResponse) {
        case DomainSuccess():
          {
            return DomainSuccess<Chat>(
              ChatMapper.toDomain(domainResponse.data),
            );
          }
        case DomainFailure():
          {
            return DomainFailure(error: domainResponse.error, data: null)
            as DomainResponse<Chat?>;
          }
      }
      return DomainFailure(error: "Something went wrong", data: null);
    } catch (e) {
      return DomainFailure(error: e.toString(), data: null);
    }
  }
}
