import 'package:musafr/feature/chat/data/modal/faq_dto.dart';
import 'package:musafr/feature/chat/data/modal/review_dto.dart';
import 'package:musafr/feature/chat/data/modal/room_dto.dart';

import 'amenities_dto.dart';

class HotelDto {
  int id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  int? noOfAdults;
  int? noOfChildren;
  int? price;
  String? location;
  int? hotelStars;
  ReviewDto? review;
  List<String>? images;
  bool? isFavourite;
  String? description;
  String? latitude;
  String? longitude;
  List<AmenitiesDto>? amenities;
  List<RoomDto>? rooms;
  List<FAQDto>? faqs;

  HotelDto({required this.id});
}
