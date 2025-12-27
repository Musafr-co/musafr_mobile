class HotelInfo {
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

  HotelInfo({required this.id, this.rating, this.amenities, this.radiusUnit, this.radius,
  this.addressLine, this.chainCode, this.cityName, this.countryCode, this.hotelId,
  this.iataCode, this.lastUpdate, this.latitude, this.longitude, this.name, this.postalCode});
}
