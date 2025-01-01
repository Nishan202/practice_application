import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier{

  // data
  int _count = 0; // this variable doesn't access to another class that's why we make this private

  // listen/observe/watch
  getValue() => _count; // we make this function to access the data though this function

  // events
  void valueIncrement(){
    // data changed
    _count++;
    notifyListeners();
  }
}