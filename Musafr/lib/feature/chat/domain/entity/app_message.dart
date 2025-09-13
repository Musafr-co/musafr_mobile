import 'package:musafr/feature/chat/domain/entity/additional_message.dart';

class AppMessage {
  int id;
  String? message;
  String? sender;
  DateTime? createdAt;
  List<AdditionalMessage>? additionalMessages;

  AppMessage({
    required this.id,
    this.message,
    this.sender,
    this.createdAt,
    this.additionalMessages,
  });
}
