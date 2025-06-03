import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static const String _authBox = 'authBox';
  static const String _tokenKey = 'token';
  static const String _emailKey = 'savedEmail';
  static const String _passwordKey = 'savedPassword';

  static Box? _box;

  Future<Box> _getBox() async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox(_authBox);
    }
    return _box!;
  }

  Future<void> saveToken(String token) async {
    final box = await _getBox();
    await box.put(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final box = await _getBox();
    return box.get(_tokenKey);
  }

  Future<void> clearToken() async {
    final box = await _getBox();
    await box.delete(_tokenKey);
  }

  Future<void> saveCredentials(String email, String password) async {
    final box = await _getBox();
    await box.put(_emailKey, email);
    await box.put(_passwordKey, password);
  }

  Future<String?> getEmail() async {
    final box = await _getBox();
    return box.get(_emailKey);
  }

  Future<String?> getPassword() async {
    final box = await _getBox();
    return box.get(_passwordKey);
  }

  Future<void> clearCredentials() async {
    final box = await _getBox();
    await box.delete(_emailKey);
    await box.delete(_passwordKey);
  }
}
