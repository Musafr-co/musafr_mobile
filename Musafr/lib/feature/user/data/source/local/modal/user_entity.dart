class UserEntity {
  String? name;
  String? profilePicture;
  String? phoneNumber;
  int id;

  UserEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.profilePicture,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      profilePicture: json['profile_picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
    };
  }

  @override
  String toString() {
    return 'UserInfo{id: $id, name: $name, phoneNumber: $phoneNumber, profilePicture: $profilePicture)}';
  }
}
