class MessageParameter {
  String cityCode;
  int? radius;
  String? radiusUnit;
  List<String>? amenities;
  int? rating;
  List<String>? hotelSource;

  MessageParameter({
    required this.cityCode,
    this.radius,
    this.radiusUnit,
    this.amenities,
    this.rating,
    this.hotelSource,
  });
}
