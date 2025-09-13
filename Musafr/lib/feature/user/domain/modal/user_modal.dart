import 'dart:core';

class UserModal {
  int id;
  String? name;
  String? email;
  String? phone;
  String? profilePicture;

  UserModal({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.profilePicture,
  });
}
