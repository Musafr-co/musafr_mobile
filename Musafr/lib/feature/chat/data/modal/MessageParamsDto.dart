class MessageParamsDto {
  String cityCode;
  int? radius;
  String? radiusUnit;
  List<String>? amenities;
  int? rating;
  List<String>? hotelSource;

  MessageParamsDto({
    required this.cityCode,
    this.radius,
    this.radiusUnit,
    this.amenities,
    this.rating,
    this.hotelSource,
  });
}
