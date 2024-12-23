import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/Widgets/modal_bottomsheet.dart';
import 'package:practice_application/db_helper.dart';

class DbDataFetch extends StatefulWidget {
  const DbDataFetch({super.key});

  @override
  State<DbDataFetch> createState() => _DbDataFetchState();
}

class _DbDataFetchState extends State<DbDataFetch> {
  // Declares the global variables here

  DBHelper dbHelper = DBHelper.getInstense();
  List<Map<String, dynamic>> mData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotes();
  }

  getNotes() async {
    mData = await dbHelper.fetchAllData();
    log(mData.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    dbHelper.fetchAllData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: mData.isNotEmpty
          ? ListView.builder(
              itemCount: mData.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(mData[index][DBHelper.COLUMN_NOTE_TITLE]),
                  subtitle: Text(mData[index][DBHelper.COLUMN_NOTE_DESC]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              dbHelper.updateNote(
                                  updatedTitle: "updatedTitle",
                                  updatedDescription: "updatedDescription",
                                  id: mData[index][DBHelper.COLUMN_NOTE_ID]);
                              getNotes();
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                          onPressed: () {
                            dbHelper.deleteNote(id: mData[index][DBHelper.COLUMN_NOTE_ID]);
                            getNotes();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })
          : const Center(
              child: Text('No notes yet!!'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // titleController.clear();
          // desController.clear;
          // dbHelper.addNote(
          //     noteTitle: "New Note", noteDescription: "new not description");
          // getNotes();
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return ModalBottomsheet();
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
