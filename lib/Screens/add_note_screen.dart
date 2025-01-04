import 'package:flutter/material.dart';
import 'package:practice_application/Widgets/custom_button.dart';
import 'package:practice_application/Widgets/custom_textfield.dart';
import 'package:practice_application/state_management/list_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tController = TextEditingController();
    TextEditingController dController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            CustomTextfield(
              controller: tController,
              hint: 'Enter note title',
              labelText: 'Title',
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              controller: dController,
              hint: 'Enter note details',
              labelText: 'Description',
              inputType: TextInputType.text,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
              onClick: () {
                context.read<ListProvider>().addData(
                    // noteTitle: 'Title',
                    // noteDesc: 'Description');
                    noteTitle: tController.text,
                    noteDescription: dController.text
                );
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
