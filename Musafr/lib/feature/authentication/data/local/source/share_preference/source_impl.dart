import 'package:musafr/feature/authentication/data/local/source/share_preference/source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharePreferenceImpl extends AuthPreferenceSource {
  SharedPreferences? preferences;
  final String authTokenKey = 'auth_token';
  final String refreshTokenKey = 'refresh_token';

  AuthSharePreferenceImpl() {
    getSharePreferences();
  }

  Future<SharedPreferences> getSharePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
    return Future.value(preferences);
  }

  @override
  Future<String?> getUserAuthToken() async {
    final preference = await getSharePreferences();
    return preference.getString(authTokenKey);
  }

  @override
  Future<String?> getUserRefreshToken() async {
    final preference = await getSharePreferences();
    return preference.getString(refreshTokenKey);
  }

  @override
  Future<void> saveUserAuthToken(String token) async {
    final preference = await getSharePreferences();
    preference.setString(authTokenKey, token);
  }

  @override
  Future<void> saveUserRefreshToken(String token) async {
    final preference = await getSharePreferences();
    preference.setString(refreshTokenKey, token);
  }

  @override
  Future<void> signOut() async {
    final preference = await getSharePreferences();
    preference.remove(authTokenKey);
    preference.remove(refreshTokenKey);
  }
}
