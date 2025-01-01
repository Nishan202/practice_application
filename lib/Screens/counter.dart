import 'package:flutter/material.dart';
import 'package:practice_application/Screens/count_increment.dart';
import 'package:practice_application/state_management/data_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App"),),
      body: Center(
        child: Text("You have pushed the button this many times ${Provider.of<DataProvider>(context).getValue()}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CountIncrement()));
      }, child: const Icon(Icons.add),),
    );
  }
}