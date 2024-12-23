import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/gridview_practise.dart';

class NetflixScreen extends StatefulWidget {
  const NetflixScreen({super.key});

  @override
  State<NetflixScreen> createState() => _NetflixScreenState();
}

class _NetflixScreenState extends State<NetflixScreen> {
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
      appBar: AppBar(
        title: const Text('Netflix'),
      ),
      body: GridView.count(
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        childAspectRatio: 1/2,
        crossAxisCount: 2,
        children: mData.map(
          (element) {
            return GridviewPractise(
                colorCode: element['color'], name: element['name']);
          },
        ).toList(),
      ),
      // body: GridView.extent(
      //   childAspectRatio: 2/1,
      //   maxCrossAxisExtent: 200,
      //   children: mData.map((element) {
      //     return GridviewPractise(
      //         colorCode: element['color'], name: element['name']);
      //   }).toList(),
      // ),

      // body: GridView.builder(
      //     itemCount: mData.length,
      //     gridDelegate:
      //         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //         SliverGridDelegateWithMaxCrossAxisExtent(
      //             maxCrossAxisExtent: 200, childAspectRatio: 1 / 2),
      //     itemBuilder: (ctx, index) {
      //       return GridviewPractise(
      //           colorCode: mData[index]['color'], name: mData[index]['name']);
      //     }),
    );
  }
}
