import 'package:flutter/material.dart';
import 'package:practice_application/Screens/add_note_screen.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/state_management/db_provider.dart';
import 'package:practice_application/state_management/list_provider.dart';
import 'package:provider/provider.dart';

class NoteHomeScreen extends StatelessWidget {
  const NoteHomeScreen({super.key});

  // List<DataModel> mData = [];
  @override
  Widget build(BuildContext context) {
    // List<DataModel> mData = [];
    TextEditingController titleController = TextEditingController();

    TextEditingController desController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      // body: Container(
      //   margin: const EdgeInsets.all(10),
      //   child: GridView.builder(itemCount: mData.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (_ , index){
      //     return GridviewPractise(colorCode: mData[index]['color'], name: mData[index]['name']);
      //   }),
      // ),
      body: Consumer<DbProvider>(
        builder: (_, provider, __) {
          // var allData = provider.fetchData();
          var mData = provider.getData();
          return mData.isNotEmpty
              ? ListView.builder(
                  itemCount: mData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      // title: Text(allData[index][ListProvider.NOTE_TITLE]),
                      // subtitle: Text(allData[index][ListProvider.NOTE_DESC]),
                      title: Text(mData[index].title),
                      subtitle: Text(mData[index].description),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // Update data without any provider
                                // dbHelper.updateNote(updateNote: DataModel(id: mData[index].id, title: updatedTitle.text, description: updatedDesc.text));
                                // getNotes();
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => AddNoteScreen()));

                                // update data through Database Provider
                                // context.read<DbProvider>().updateData(uData: DataModel(title: mData[index].title, description: mData[index].description, id: mData[index].id),);
                                // This is for fetch current data in textfield
                                titleController.text = mData[index].title;
                                desController.text = mData[index].description;

                                showModalBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      padding: const EdgeInsets.all(11),
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
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(11),
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
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 11,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {
                                                  context
                                                      .read<DbProvider>()
                                                      .updateData(
                                                        uData: DataModel(
                                                            title:
                                                                titleController
                                                                    .text,
                                                            description:
                                                                desController
                                                                    .text,
                                                            id: mData[index]
                                                                .id),
                                                      );
                                                      Navigator.pop(context);
                                                },
                                                child: const Text('Save'),
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
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                // Delete data without any provider
                                // dbHelper.deleteNote(id: mData[index].id);
                                // getNotes();

                                // Delete data through List Provider
                                // context
                                //     .read<ListProvider>()
                                //     .deleteData(index: index);

                                // Delete data through Database provider
                                context
                                    .read<DbProvider>()
                                    .deleteData(noteId: mData[index].id);
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
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
