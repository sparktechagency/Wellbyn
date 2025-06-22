import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static final TokenService _instance = TokenService._internal();
  factory TokenService() => _instance;
  TokenService._internal();

  static const String _accessTokenKey = 'access_token';
  static const String _userIdKey = 'user_id';

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveToken(String token) async {
    await _prefs?.setString(_accessTokenKey, token);
  }

  String? getToken() {
    return _prefs?.getString(_accessTokenKey);
  }

  Future<void> removeToken() async {
    await _prefs?.remove(_accessTokenKey);
  }

  Future<void> saveUserId(String id) async {
    await _prefs?.setString(_userIdKey, id);
  }

  String? getUserId() {
    return _prefs?.getString(_userIdKey);
  }

  Future<void> removeUserId() async {
    await _prefs?.remove(_userIdKey);
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}