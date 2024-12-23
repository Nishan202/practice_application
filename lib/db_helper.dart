import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

// to privatize the constructor
  DBHelper._();

// Singleton Object
  static DBHelper getInstense() => DBHelper._();

  Database? mDB;

  Future<Database> getDB () async {
    // if(mDB != null){
    //   return mDB!;
    // } else {
    //   mDB = await openDB();
    //   return mDB!;
    // }
    // ? : Else -> This is more sorter version than previous
    // return mDB!= null ? mDB! : await openDB();
    // we can make it one line -> This is most sorter version
    return mDB ??= await openDB();
  }
  // Step 1 -> Open DB if created ?? then open, if Not then first create DB then open
  Future<Database> openDB()async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");
    return await openDatabase(dbPath,version: 1, onCreate: (db , version){
      db.execute(
        'CREATE TABLE NOTE (note_id INTEGER PRIMARY KEY AUTOINCREMENT, note_title TEXT, note_description TEXT)'
      );
    });
  }

// Add data in Database
  Future<bool> addNote ({required String noteTitle, required String noteDescription}) async {
    var db = await getDB();

    int rowsEffected = await db.insert("note", {
      "note_title" : noteTitle,
      "note_description" : noteDescription
    });
    return rowsEffected > 0;
  }

// Update data in Database
  Future<bool> updateNote ({required String updatedTitle, required String updatedDescription, required int id}) async {
    var db = await getDB();

    int rowsEffected = await db.update("note", {
      "note_title" : updatedTitle,
      "note_description" : updatedDescription
    }, where: "note_id = $id");
    return rowsEffected > 0;
  }

  // Delete data from Database
  Future<bool> deleteNote ({required int id}) async {
    var db = await getDB();

    int rowsEffected = await db.delete("note" , where: "note_id = $id");
    return rowsEffected > 0;
  }

// Fetch data from Database
  Future<List<Map<String, dynamic>>> fetchAllData() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query("note");

    return mData;
  }
}