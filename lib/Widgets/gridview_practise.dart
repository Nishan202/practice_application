import 'package:flutter/material.dart';

class GridviewPractise extends StatelessWidget {
  Color colorCode;
  String name;
  GridviewPractise({super.key, required this.colorCode, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      // color: colorCode,
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: colorCode),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
