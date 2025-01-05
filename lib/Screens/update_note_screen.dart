import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_button.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/db/data_model.dart';
import 'package:practice_application/state_management/db_provider.dart';
import 'package:provider/provider.dart';

class UpdateNoteScreen extends StatelessWidget {
  const UpdateNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mData = context.read<DbProvider>().getData();
    
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

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
              onClick: () {
                // add note through List provider
                // context.read<ListProvider>().addData(
                //     noteTitle: tController.text,
                //     noteDescription: dController.text
                // );

                // Add note through Database Provider
                context.read<DbProvider>().updateData(uData: DataModel(title: titleController.text, description: descriptionController.text),);
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