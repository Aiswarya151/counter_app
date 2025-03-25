import 'package:counter_app/features/counter/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController countController = TextEditingController();
  @override
  void initState() {
    context.read<CounterProvider>().fetchCounters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        // leading: Icon(Icons.arrow_back),
      ),
      body: ListView.builder(
          itemCount: counterProvider.counters.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(counterProvider.counters[index].title ?? ""),
                trailing: Text('${counterProvider.counters[index].count}'),
                onTap: () {
                  context.pushNamed('counterdetail',
                      extra: counterProvider.counters[index]);
                },
              )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: countController,
                        decoration: InputDecoration(labelText: 'Count'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            counterProvider.createCounter(
                              context,
                               title: titleController.text,
                                count: int.tryParse(countController.text) ?? 0);
                                Navigator.pop(context); 
                          },
                          child: Text('submit'))
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
