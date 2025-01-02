import 'package:flutter/material.dart';
import 'package:practice_application/state_management/data_provider.dart';
import 'package:provider/provider.dart';

class CountModification extends StatelessWidget {
  const CountModification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // listen / observe / watch
        child: Text("Please enter plus button to increment the count"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // Provider.of<DataProvider>(context, listen: false).valueIncrement();
              context.read<DataProvider>().valueDecrement();
            },
            icon: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              // Provider.of<DataProvider>(context, listen: false).valueIncrement();
              context.read<DataProvider>().valueIncrement();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
