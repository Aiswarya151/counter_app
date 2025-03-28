import 'package:counter_app/features/counter/viewmodel/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showAddCounterBottomSheet({required BuildContext context}) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController countController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Allows the sheet to expand when keyboard appears
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: countController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Count"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().createCounter(
                  title: titleController.text,
                  count: int.parse(countController.text),
                );
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text("Submit"),
            ),
          ],
        ),
      );
    },
  );
}