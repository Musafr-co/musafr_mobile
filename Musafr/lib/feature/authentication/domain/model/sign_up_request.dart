class SignUpRequest {
  String email;
  String password;
  String referralCode;
  String userName;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.referralCode,
    required this.userName,
  });
}
