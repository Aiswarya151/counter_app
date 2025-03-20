import 'package:counter_app/features/counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.read<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        // leading: Icon(Icons.arrow_back),
      ),
      body: ListView.builder(
          itemCount: counterProvider.counters.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(counterProvider.counters[index].title),
                trailing: Text('${counterProvider.counters[index].value}'),
                onTap: () {
                  context.pushNamed('counterdetail',
                      extra: counterProvider.counters[index]);
                },
              )),
    );
  }
}
