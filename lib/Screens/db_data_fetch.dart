import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/Widgets/modal_bottomsheet.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/db/db_helper.dart';

class DbDataFetch extends StatefulWidget {
  const DbDataFetch({super.key});

  @override
  State<DbDataFetch> createState() => _DbDataFetchState();
}

class _DbDataFetchState extends State<DbDataFetch> {
  // Declares the global variables here

  DBHelper dbHelper = DBHelper.getInstense();
  List<DataModel> mData = [];

  // TextEditingController updatedTitle = TextEditingController();
  // TextEditingController updatedDesc = TextEditingController();
  TextEditingController titleController = TextEditingController();

  TextEditingController desController = TextEditingController();

  @override
  void initState() {
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
                  title: Text(mData[index].title),
                  subtitle: Text(mData[index].description),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // dbHelper.updateNote(updateNote: DataModel(id: mData[index].id, title: updatedTitle.text, description: updatedDesc.text));
                              // getNotes();
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                          onPressed: () {
                            dbHelper.deleteNote(id: mData[index].id);
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
              return Container(
                padding: const  EdgeInsets.all(11),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      'Add Note',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter title here..",
                        label: const Text('Title'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: desController,
                      minLines: 4,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "Enter desc here..",
                        label: const Text('Desc'),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            bool check = await dbHelper.addNote(
                                newNote: DataModel(
                                    title: titleController.text,
                                    description: desController.text));
                            if (check) {
                              getNotes();
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Add'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
