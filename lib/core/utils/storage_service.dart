import 'dart:convert';

import 'package:counter_app/features/authentication/data/model/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService{
  static const _storage = FlutterSecureStorage();
  static const _userKey = "user_data";

   // Save user data (username, email, token)
  Future<void> saveUserData({required UserModel user}) async {
    UserModel userData = UserModel(message: user.message, user: user.user,token: user.token);
    await _storage.write(key: _userKey, value: jsonEncode(userData));
  }

  // Get user data (returns a Map)
  Future<UserModel?> getUserData() async {
    String? userDataString = await _storage.read(key: _userKey);
    if (userDataString != null) {
      return UserModel.fromJson(jsonDecode(userDataString));
    }
    return null;
  }

  // Clear user data
  Future<void> clearUserData() async {
    await _storage.delete(key: _userKey);
  }
  }