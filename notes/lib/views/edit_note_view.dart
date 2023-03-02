import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/constants/const.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/widgets/app_bar.dart';
import 'package:notes/views/widgets/edit_note_item_builder.dart';
import 'package:notes/views/widgets/input_Text_Builder.dart';

import '../cubit/note_view/cubit/note_view_cubit.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              AppBarBuilder(
                  onPressed: () {
                    note.save();
                    NoteViewCubit.get(context).fetchNoteView();
                    Navigator.pop(context);
                  },
                  icon: Icons.check,
                  title: 'Edit Confirm'),
              const SizedBox(
                height: 20,
              ),
              CustomInputTextBuilder(
                  onChange: (value) {
                    note.title = value ?? note.title;
                  },
                  color: kPrimaryColor,
                  hint: note.title),
              const SizedBox(
                height: 20,
              ),
              CustomInputTextBuilder(
                onChange: (value) {
                  note.subTitle = value ?? note.subTitle;
                },
                color: kPrimaryColor,
                hint: note.subTitle,
                maxLine: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
