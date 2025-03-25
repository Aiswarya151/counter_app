import 'package:counter_app/features/counter/model/counter_model.dart';
import 'package:counter_app/features/counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterDetailScreen extends StatelessWidget {
  final Counter counter;
  const CounterDetailScreen({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body: Center(
        //     child:
        Consumer<CounterProvider>(
      builder: (context, counterprovider, child) {
        return Scaffold(
          appBar: AppBar(title: Text(counter.title ?? "")),
          //mainAxisAlignment: MainAxisAlignment.center,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter Value:${counter.count}'),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      counterprovider.incrementCounter(counter.id ?? "");
                    },
                    child: Text('Increment')),
              ],
            ),
          ),
        );
      },
    );
    // ),
    // );
  }
}
