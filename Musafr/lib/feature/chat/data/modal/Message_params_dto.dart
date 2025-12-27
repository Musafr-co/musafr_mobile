class MessageParamsDto {
  String? cityCode;
  int? radius;
  String? radiusUnit;
  List<String>? amenities;
  int? rating;
  List<String>? hotelSource;

  MessageParamsDto({
    this.cityCode,
    this.radius,
    this.radiusUnit,
    this.amenities,
    this.rating,
    this.hotelSource,
  });

  factory MessageParamsDto.fromJson(Map<String, dynamic> json) {
    try {
      return MessageParamsDto(
        cityCode: json['cityCode'],
        radius: json['radius'],
        radiusUnit: json['radiusUnit'],
        amenities: List<String>.from(json['amenities']??[]),
        rating: json['rating'],
        hotelSource: List<String>.from(json['hotelSource']??[]),
      );
    } catch (exception) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'cityCode': cityCode,
      'radius': radius,
      'radiusUnit': radiusUnit,
      'amenities': amenities,
      'rating': rating,
      'hotelSource': hotelSource,
    };
  }
}
