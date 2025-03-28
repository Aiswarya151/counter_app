import 'package:dio/dio.dart';

class CounterService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://counter-app-backend.onrender.com/api';

  // Fetch all counters (GET)
  Future<Response> fetchCounters() async {
    try {
      final response = await _dio.get('$_baseUrl/counter');
      return response;
    } catch (e) {
      throw Exception("Failed to fetch counters: $e");
    }
  }

  // Create a new counter (POST)
  Future<Response> createCounter({required String title, required int count}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/counter',
        data: {
          'title': title,
          'count': count,
        },
      );
      return response;
    } catch (e) {
      throw Exception("Failed to create counter: $e");
    }
  }

   // increment Counter
  Future<Response> incrementCounter({required String counterId}) async {
    try {
      final response = await _dio.put('$_baseUrl/counter/$counterId/increment');
      return response;
    } catch(e){
      throw Exception("Failed to create counter: $e");
    }
  }
  
}
