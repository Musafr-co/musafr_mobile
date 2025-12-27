class AmenitiesDto {
  String? image;
  String title;

  AmenitiesDto({required this.title, this.image});

  factory AmenitiesDto.fromJson(Map<String, dynamic> json) {
    return AmenitiesDto(image: json['image'], title: json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'image': image};
  }
}
