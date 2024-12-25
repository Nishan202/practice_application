import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/db/db_helper.dart';

class ModalBottomsheet extends StatefulWidget {

  ModalBottomsheet({super.key});

  @override
  State<ModalBottomsheet> createState() => _ModalBottomsheetState();
}

class _ModalBottomsheetState extends State<ModalBottomsheet> {
  TextEditingController titleController = TextEditingController();

  TextEditingController desController = TextEditingController();

  DBHelper dbHelper = DBHelper.getInstense();

  List<DataModel> mData = [];

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    mData = await dbHelper.fetchAllData();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // titleController.text = "";
    // desController.clear();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(11),
      child: Column(
        children: [
          const Text('Add Note', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          const SizedBox(
            height: 10,
          ),
          CustomTextfield(
            controller: titleController,
            labelText: 'Title',
            hint: 'Add title here..',
            // inputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextfield(
            minimuLine: 4,
            maximumLine: 6,
            controller: desController,
            labelText: 'Decription',
            hint: 'Write something here...',
            // inputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(onPressed: () async {
                bool check = await dbHelper.addNote(newNote: DataModel(title: titleController.text, description: desController.text));
                if(check){
                  getNotes();
                  log(check.toString());
                  Navigator.pop(context);
                }
              }, child: Text('Add')),
              OutlinedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
