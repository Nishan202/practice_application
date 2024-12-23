import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/gridview_practise.dart';

class NoteHomeScreen extends StatefulWidget {
  const NoteHomeScreen({super.key});

  @override
  State<NoteHomeScreen> createState() => _NoteHomeScreenState();
}

class _NoteHomeScreenState extends State<NoteHomeScreen> {
  List<Map<String, dynamic>> mData = [
    {"color": Colors.green, "name": "Nishan"},
    {"color": Colors.red, "name": "Aditya"},
    {"color": Colors.orange, "name": "Sandipan"},
    {"color": Colors.blue, "name": "Arpendra"},
    {"color": Colors.yellow, "name": "Diptesh"},
    {"color": Colors.pink, "name": "Amanisha"},
    {"color": Colors.grey, "name": "Priyanka"},
    {"color": Colors.deepPurple, "name": "Sushovan"},
    {"color": Colors.brown, "name": "Gourab"},
    {"color": Colors.cyanAccent, "name": "Supriyo"},
    {"color": Colors.indigo, "name": "Moli"},
    {"color": Colors.tealAccent, "name": "Manali"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(itemCount: mData.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (_ , index){
          return GridviewPractise(colorCode: mData[index]['color'], name: mData[index]['name']);
        }),
      ),
    );
  }
}