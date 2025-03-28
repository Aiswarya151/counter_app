import 'package:counter_app/core/utils/urls.dart';
import 'package:dio/dio.dart';

class AuthServices {
  final Dio _dio = Dio();

  // Register the User
  Future<Response> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(Urls.baseUrl + Urls.signUp, data:  {
      'username': username,
      'email': email,
      'password': password,
    });
    return response;
  }

  // Login User
  Future<Response> login ({required String email, required String password}) async {
    final response = await _dio.post(Urls.baseUrl + Urls.login, data: {
      'email': email,
      'password': password,
    });
    return response;
  }
}