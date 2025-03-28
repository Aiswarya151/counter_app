
import 'package:counter_app/features/counter/presentation/widgets/add_counter_bottomsheet.dart';
import 'package:counter_app/features/counter/viewmodel/counter_provider.dart';
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
  late CounterProvider counterProvider;
  @override
  void initState() {
    counterProvider = context.read<CounterProvider>();
    counterProvider.fetchCounters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Consumer<CounterProvider>(
        builder: (context, counterProvider, child) {
          if (counterProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: counterProvider.counters.length,
            itemBuilder:
                (context, index) => ListTile(
                  onTap: () {
                    context.pushNamed(
                      "counterDetailScreen",
                      extra: counterProvider.counters[index],
                    );
                  },
                  title: Text(counterProvider.counters[index].title ?? ""),
                  trailing: Text("${counterProvider.counters[index].count}"),
                ),
          );
        },
      ),
     floatingActionButton: FloatingActionButton(
        onPressed: () {
         showAddCounterBottomSheet(
              context: context,
            );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
      ),
    );
  }
}
