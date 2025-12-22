
class MessageMetaDataDto {
  String? location;
  int? guestsCount;
  int? roomsQuantity;
  String? checkInDate;
  String? checkOutDate;

  MessageMetaDataDto({
    this.location,
    this.guestsCount,
    this.roomsQuantity,
    this.checkInDate,
    this.checkOutDate,
  });

  factory MessageMetaDataDto.fromJson(Map<String, dynamic> json) {
    try {
      return MessageMetaDataDto(
        location: json['location'],
        guestsCount: json['guestsCount'],
        roomsQuantity: json['roomsQuantity'],
        checkInDate: json['checkInDate'],
        checkOutDate: json['checkOutDate']
      );
    }catch(exception){
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'guestsCount': guestsCount,
      'roomsQuantity': roomsQuantity,
      'checkInDate': checkInDate,
      'checkOutDate': checkOutDate
    };
  }
}
