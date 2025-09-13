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
}
