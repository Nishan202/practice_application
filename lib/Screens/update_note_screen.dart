import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_button.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/state_management/db_provider.dart';
import 'package:provider/provider.dart';

class UpdateNoteScreen extends StatelessWidget {
  DataModel dataModel;
  // VoidCallback onTap;
  UpdateNoteScreen({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    // var mData = context.read<DbProvider>().getData();
    
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    // This is for fetch current data in textfield
    titleController.text = dataModel.title;
    descriptionController.text = dataModel.description;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            CustomTextfield(
              controller: titleController,
              hint: 'Enter note title',
              labelText: 'Title',
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              controller: descriptionController,
              hint: 'Enter note details',
              labelText: 'Description',
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onClick: (){
                context.read<DbProvider>().updateData(uData: DataModel(title: titleController.text, description: descriptionController.text, id: dataModel.id),);
                Navigator.pop(context);
              },
              title: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}