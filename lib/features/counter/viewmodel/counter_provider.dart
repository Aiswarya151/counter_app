import 'dart:developer';
import 'package:counter_app/features/counter/data/model/counter_model.dart';
import 'package:counter_app/features/counter/data/services/counter_services.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  List<Counter> _counters = [];
  List<Counter> get counters => _counters;

   bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Fetch all counters
  Future<void> fetchCounters() async {
     _isLoading = true;
    try {
      final response = await CounterService().fetchCounters();
      if (response.statusCode == 200) {
        log("Api Response: ${response.data.toString()}");
        final List<dynamic> data = response.data as List<dynamic>;
        _counters = data.map((counter) => Counter.fromJson(counter)).toList();
        log(_counters.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    finally {
      _isLoading = false;
      notifyListeners();
    }
    
  }
  Future<void> createCounter({
    required String title,
    required int count,
  }) async {
    try {
      final response = await CounterService().createCounter(
        title: title,
        count: count,
      );
      if (response.statusCode == 201) {
        log("Api Response: ${response.data.toString()}");
        await fetchCounters();
      }
    } catch (e) {
      log(e.toString());
    }
  }
  Future<void> incrementCounter({required String counterId}) async {
    try {
      final response = await CounterService().incrementCounter(
        counterId: counterId,
      );
      if (response.statusCode == 200) {
        log("Api Response: ${response.data.toString()}");
        await fetchCounters();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      notifyListeners();
    }
  }
}
