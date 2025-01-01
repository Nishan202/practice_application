import 'package:flutter/material.dart';
import 'package:practice_application/state_management/data_provider.dart';
import 'package:provider/provider.dart';

class CountIncrement extends StatelessWidget {
  const CountIncrement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // listen / observe / watch
        child: Text("Please enter plus button to increment the count"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DataProvider>(context, listen: false).valueIncrement();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
