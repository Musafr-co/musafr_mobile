class HotelDto {
  int id;
  String? hotelId;
  String? name;
  String? chainCode;
  String? iataCode;
  double? latitude;
  double? longitude;
  String? addressLine;
  String? cityName;
  String? countryCode;
  String? postalCode;
  double? radius;
  String? radiusUnit;
  double? rating;
  String? amenities;
  String? lastUpdate;

  HotelDto({
    required this.id,
    this.rating,
    this.amenities,
    this.radiusUnit,
    this.radius,
    this.addressLine,
    this.chainCode,
    this.cityName,
    this.countryCode,
    this.hotelId,
    this.iataCode,
    this.lastUpdate,
    this.latitude,
    this.longitude,
    this.name,
    this.postalCode,
  });

  factory HotelDto.fromJson(Map<String, dynamic> json) {
    try {
      return HotelDto(
        id: json['id'],
        hotelId: json['hotelId'],
        name: json['name'],
        chainCode: json['chainCode'],
        iataCode: json['iataCode'],
        latitude: (json['latitude'] ?? 0 as num).toDouble(),
        longitude: (json['longitude'] ?? 0 as num).toDouble(),
        addressLine: json['addressLine'],
        cityName: json['cityName'],
        countryCode: json['countryCode'],
        postalCode: json['postalCode'],
        radius: (json['radius'] ?? 0 as num).toDouble(),
        radiusUnit: json['radiusUnit'],
        rating: (json['rating'] ?? 0 as num).toDouble(),
        amenities: json['amenities'],
        lastUpdate: json['lastUpdate'],
      );
    } catch (exception) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelId': hotelId,
      'name': name,
      'chainCode': chainCode,
      'iataCode': iataCode,
      'latitude': latitude,
      'longitude': longitude,
      'addressLine': addressLine,
      'cityName': cityName,
      'countryCode': countryCode,
      'postalCode': postalCode,
      'radius': radius,
      'radiusUnit': radiusUnit,
      'rating': rating,
      'amenities': amenities,
      'lastUpdate': lastUpdate,
    };
  }
}
