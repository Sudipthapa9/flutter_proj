import 'package:get_storage/get_storage.dart';

class TokenStorage {
  static final GetStorage _box = GetStorage();

  static const String _accessTokenKey = "access_token";

  static Future<void> saveToken(String accessToken) async {
    await _box.write(_accessTokenKey, accessToken);
  }

  static String? getToken() {
    return _box.read<String>(_accessTokenKey);
  }

  static Future<void> deleteToken() async {
    await _box.remove(_accessTokenKey);
  }
}
