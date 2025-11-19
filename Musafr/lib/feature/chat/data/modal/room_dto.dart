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

  RoomDto({
    required this.id,
    this.title,
    this.endDate,
    this.noOfAdults,
    this.noOfChildren,
    this.pricePerNight,
    this.roomServices,
    this.startDate,
  });

  factory RoomDto.fromJson(Map<String, dynamic> json) {
    return RoomDto(
      id: json['id'],
      title: json['title'],
      endDate: DateTime.parse(json['endDate']),
      noOfAdults: json['noOfAdults'],
      noOfChildren: json['noOfChildren'],
      pricePerNight: json['pricePerNight'],
      roomServices:
          json['roomServices']
              .map<RoomServiceDto>((item) => RoomServiceDto.fromJson(item))
              .toList(),
      startDate: DateTime.parse(json['startDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'endDate': endDate?.toIso8601String(),
      'noOfAdults': noOfAdults,
      'noOfChildren': noOfChildren,
      'pricePerNight': pricePerNight,
      'roomServices': roomServices?.map((item) => item.toJson()).toList(),
      'startDate': startDate?.toIso8601String(),
    };
  }
}
