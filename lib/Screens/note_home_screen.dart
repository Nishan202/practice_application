import 'package:flutter/material.dart';
import 'package:practice_application/Screens/add_note_screen.dart';
import 'package:practice_application/state_management/list_provider.dart';
import 'package:provider/provider.dart';

class NoteHomeScreen extends StatelessWidget {
  const NoteHomeScreen({super.key});

  // List<Map<String, dynamic>> mData = [];
  @override
  Widget build(BuildContext context) {
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
      body: Consumer<ListProvider>(
        builder: (_, provider, __) {
          var allData = provider.fetchData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (_, index) {
                    return ListTile(
                      title: Text(allData[index][ListProvider.NOTE_TITLE]),
                      subtitle: Text(allData[index][ListProvider.NOTE_DESC]),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // dbHelper.updateNote(updateNote: DataModel(id: mData[index].id, title: updatedTitle.text, description: updatedDesc.text));
                                // getNotes();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddNoteScreen()));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                // dbHelper.deleteNote(id: mData[index].id);
                                // getNotes();
                                context
                                    .read<ListProvider>()
                                    .deleteData(index: index);
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
              : const Center(child: Text('No notes yet!!'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
