import 'package:flutter/material.dart';
import 'package:practice_application/Screens/count_modification.dart';
import 'package:practice_application/state_management/data_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    print("Built again");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        // listen / watch / observe
        // child: Text(
        //   // "You have pushed the button this many times ${Provider.of<DataProvider>(context).getValue()}",
        //   "You have pushed the button this many times ${context.watch<DataProvider>().getValue()}",
        // ),
        child: Consumer<DataProvider>(
          builder: (ctx, provider, _) => Text(
            // "You have pushed the button this many times ${ctx.watch<DataProvider>().getValue()}",
            "You have pushed the button this many times ${provider.getValue()}",
          ),
        ),
        // child: Consumer<DataProvider>(builder: (ctx, provider, _) {
        //   print("consumer built again");
        //   return Text(
        //     "You have pushed the button this many times ${ctx.watch<DataProvider>().getValue()}",
        //   );
        // }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CountModification()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
