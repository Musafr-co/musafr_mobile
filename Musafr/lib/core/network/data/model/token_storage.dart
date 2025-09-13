class TokenStorage {
  static String? _accessToken;
  static String? _refreshToken;

  static String? get accessToken => _accessToken;
  static String? get refreshToken => _refreshToken;

  static void saveTokens(String access, String refresh) {
    _accessToken = access;
    _refreshToken = refresh;
  }
}
