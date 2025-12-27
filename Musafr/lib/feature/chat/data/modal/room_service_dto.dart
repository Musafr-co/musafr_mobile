class RoomServiceDto{

  String? title;
  String? image;
  RoomServiceDto({this.title, this.image});
  factory RoomServiceDto.fromJson(Map<String, dynamic> json) {
    return RoomServiceDto(
      title: json['title'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
    };
  }
}