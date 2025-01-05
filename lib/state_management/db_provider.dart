import 'package:flutter/material.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/db/db_helper.dart';

class DbProvider extends ChangeNotifier{
  DBHelper dbHelper;
  DbProvider({required this.dbHelper});
  List<DataModel> _mData = [];

  // fetch all data 
  List<DataModel> getData() => _mData;
  
  // fetch initial data
  fetchInitialData() async {
    _mData = await dbHelper.fetchAllData();
    notifyListeners();
  }

  addData({required DataModel aData}) async {
    bool check = await dbHelper.addNote(newNote: aData);
    if(check){
      _mData = await dbHelper.fetchAllData();
      notifyListeners();
    }
  }

  updateData({required DataModel uData}) async {
    bool check = await dbHelper.updateNote(updateNote: uData);
    if(check){
      _mData = await dbHelper.fetchAllData();
      notifyListeners();
    }
  }

  deleteData({required int noteId}) async {
    bool check = await dbHelper.deleteNote(id: noteId);
    if(check){
      _mData = await dbHelper.fetchAllData();
      notifyListeners();
    }
  }
}