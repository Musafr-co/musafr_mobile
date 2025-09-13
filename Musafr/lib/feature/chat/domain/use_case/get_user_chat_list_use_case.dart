import '../../../../core/domain/model/domain_response.dart';
import '../entity/chat_detail.dart';
import '../repository/chat_repository.dart';

class GetUserChatListUseCase {
  final ChatRepository _chatRepository;

  GetUserChatListUseCase(this._chatRepository);

  Future<DomainResponse<List<Chat>>> invoke() async {
    await Future.delayed(Duration(seconds: 5));
    return DomainSuccess([
      Chat(
        id: 1,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
      Chat(
        id: 2,
        title: "title",
        image: null,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        noOfAdults: 4,
        noOfChildren: 2
      ),
    ]);
    return await _chatRepository.getUserChats();
  }
}
