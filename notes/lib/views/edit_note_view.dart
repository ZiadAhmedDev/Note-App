import 'package:flutter/material.dart';
import 'package:notes/constants/const.dart';
import 'package:notes/views/widgets/app_bar.dart';
import 'package:notes/views/widgets/edit_note_item_builder.dart';
import 'package:notes/views/widgets/input_Text_Builder.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppBarBuilder(icon: Icons.check, title: 'Edit Confirm'),
            CustomEditNoteItem(),
            CustomInputTextBuilder(color: kPrimaryColor, hint: 'title'),
            CustomInputTextBuilder(
              color: kPrimaryColor,
              hint: 'content',
              maxLine: 5,
            ),
          ],
        ),
      ),
    );
  }
}
