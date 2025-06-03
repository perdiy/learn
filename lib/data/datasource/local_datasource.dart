import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static const String _authBox = 'authBox';
  static const String _tokenKey = 'token';
  static const String _emailKey = 'savedEmail';
  static const String _passwordKey = 'savedPassword';

  late Box _box;

  // Inisialisasi, harus dipanggil sekali sebelum menggunakan
  Future<void> init() async {
    _box = await Hive.openBox(_authBox);
  }

  Future<void> saveToken(String token) async {
    await _box.put(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return _box.get(_tokenKey);
  }

  Future<void> clearToken() async {
    await _box.delete(_tokenKey);
  }

  Future<void> saveCredentials(String email, String password) async {
    await _box.put(_emailKey, email);
    await _box.put(_passwordKey, password);
  }

  Future<String?> getEmail() async {
    return _box.get(_emailKey);
  }

  Future<String?> getPassword() async {
    return _box.get(_passwordKey);
  }

  Future<void> clearCredentials() async {
    await _box.delete(_emailKey);
    await _box.delete(_passwordKey);
  }
}
