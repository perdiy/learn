import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/login/response/login_response_model.dart';

class LocalDataSource {
  Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    final authData = LoginResponseModel.fromJson(jsonDecode(authJson));
    return authData.token ?? '';
  }

  Future<bool> saveAuthData(LoginResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = await pref.setString('auth', jsonEncode(model.toJson()));
    return res;
  }

  Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth');
  }
}
