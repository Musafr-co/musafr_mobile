import 'package:musafr/feature/chat/data/modal/room_service_dto.dart';

class RoomDto {
  int id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  int? noOfAdults;
  int? noOfChildren;
  List<RoomServiceDto>? roomServices;
  int? pricePerNight;

  RoomDto({required this.id});
}
