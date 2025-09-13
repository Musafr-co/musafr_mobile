import 'package:musafr/feature/chat/domain/repository/chat_repository.dart';

import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';

class CreateANewChatUseCase {
  final ChatRepository _chatRepository;

  CreateANewChatUseCase(this._chatRepository);

  Future<DomainResponse<Chat>> invoke() {
    return _chatRepository.createNewChat();
  }
}
