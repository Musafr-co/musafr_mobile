import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';
import 'package:musafr/feature/chat/domain/repository/chat_repository.dart';

import '../../../../core/domain/model/domain_response.dart';

class GetSpecificChatDetailUseCase {
  final ChatRepository _chatRepository;

  GetSpecificChatDetailUseCase(this._chatRepository);

  Future<DomainResponse<Chat>> invoke(int id) async {
    return await _chatRepository.getChatById(id);
  }
}
