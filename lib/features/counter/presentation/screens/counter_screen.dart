
import 'package:counter_app/features/authentication/viewmodel/auth_provider.dart';
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
      appBar: AppBar(title: Text("Counter"),
       actions: [
        TextButton.icon(icon: Icon(Icons.logout,color: Colors.white,),label: Text('Logout',style: TextStyle(color: Colors.white),),
        onPressed: () {
            _showLogoutDialog(context);
        },
        ),
         
        ],),
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
                      "counterdetail",
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

  void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              context.read<AuthProvider>().logout(context); // Perform logout
            },
            child: Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

}
