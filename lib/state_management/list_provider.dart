import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  static final String NOTE_TITLE = 'note_title';
  static final String NOTE_DESC = 'note_description';
  
  List<Map<String, dynamic>> _mData = [];

  // Add data in list
  addData({required String noteTitle, required String noteDescription}){
    _mData.add({
      NOTE_TITLE : noteTitle,
      NOTE_DESC : noteDescription
    });
    notifyListeners();
  }

  // fetch data
  List<Map<String, dynamic>> fetchData() => _mData;

  // Update data in list
  updateData({required String updatedTitle, required String updatedDesc, required int index}){
    _mData[index] = {
      NOTE_TITLE : updatedTitle,
      NOTE_DESC : updatedDesc
    };
    notifyListeners();
  }

  // Delete data from list
  deleteData({required int index}){
    _mData.removeAt(index);
    notifyListeners();
  }
}