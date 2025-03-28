import 'package:counter_app/features/counter/data/model/counter_model.dart';

import 'package:counter_app/features/counter/viewmodel/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterDetailScreen extends StatelessWidget {
  final Counter counter;
  const CounterDetailScreen({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    // final counterId = counter.id??"";
    return Scaffold(
      appBar: AppBar(title: Text(counter.title ?? "")),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, counterProvider, child) {
            final updatedCounter = counterProvider.counters.firstWhere(
              (c) => c.id == counter.id,
              orElse: () => Counter(id: counter.id, title: "Unknown", count: 0),
            );

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter Value: ${updatedCounter.count}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    counterProvider.incrementCounter(
                      counterId: counter.id ?? "",
                    );
                  },
                  child: Text("Increment"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}