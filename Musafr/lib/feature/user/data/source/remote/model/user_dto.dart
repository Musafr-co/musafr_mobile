import 'dart:math';

class UserDto {
  int id;
  String? name;
  String? email;
  String? profilePicture;
  String? authToken;
  String? refreshToken;

  UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
    this.authToken,
    this.refreshToken
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id']?? Random().nextInt(1000000000),
      name: json['username'],
      email: json['email'],
      profilePicture: json['profilePicture'],
      authToken: json['token'],
      refreshToken: json['refresh_token'],
    );
  }
  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      profilePicture: map['profilePicture'],
      authToken: map['authToken'],
      refreshToken: map['refreshToken'],
    );
  }
}
