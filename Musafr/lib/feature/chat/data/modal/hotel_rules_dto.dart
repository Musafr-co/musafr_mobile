class HotelRulesDto{
  String? title;
  String? value;
  String? icon;
  HotelRulesDto({this.title, this.value, this.icon});
  factory HotelRulesDto.fromJson(Map<String, dynamic> json) {
    return HotelRulesDto(
      title: json['title'],
      value: json['value'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "value": value,
      "icon": icon,
    };
  }
}