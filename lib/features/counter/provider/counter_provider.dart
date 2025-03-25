import 'dart:developer';
import 'package:counter_app/features/counter/model/counter_model.dart';
import 'package:counter_app/features/counter/services/counter_services.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  List<Counter> _counters = [];
  List<Counter> get counters => _counters;

  // Fetch all counters
  Future<void> fetchCounters() async {
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
    

      notifyListeners();
    
  }
  Future<void> createCounter( BuildContext context,{required String title,required int count}) async{
    try{
    final response=await CounterService().createCounter(title: title, count: count);
   if (response.statusCode == 200) {
        log("Api Response: ${response.data.toString()}");
        // Show Snackbar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Submitted successfully'),
          backgroundColor: Colors.green,
        ),
      );
   }
   
      }
      catch(e){
        log(e.toString());
      }
      finally{
      notifyListeners();
    }
  }
  void incrementCounter(String id) { // id should be a String
    final counter = _counters.firstWhere((c) => c.id == id, orElse: () => Counter());
    if (counter.id != null) {
      counter.count = (counter.count ?? 0) + 1; // Handle null safety
      notifyListeners();
    }
  }
}
