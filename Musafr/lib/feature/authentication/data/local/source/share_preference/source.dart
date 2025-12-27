abstract class AuthPreferenceSource{
  Future<String?> getUserAuthToken();
  Future<void> saveUserAuthToken(String token);
  Future<void> signOut();
  Future<void> saveUserRefreshToken(String token);
  Future<String?> getUserRefreshToken();
}