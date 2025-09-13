class SignUpRequest {
  String email;
  String password;
  String referralCode;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.referralCode,
  });
}
