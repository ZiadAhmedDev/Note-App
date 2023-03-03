import 'package:flutter/material.dart';
import 'package:TheNote/constants/const.dart';
import 'package:TheNote/model/note_model.dart';
import 'package:TheNote/views/widgets/app_bar.dart';
import 'package:TheNote/views/widgets/color_list_edit.dart';
import 'package:TheNote/views/widgets/input_Text_Builder.dart';
import '../cubit/note_view/cubit/note_view_cubit.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note'), centerTitle: true),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              hint: note.title,
              colorHint: Colors.grey[400],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputTextBuilder(
              onChange: (value) {
                note.subTitle = value ?? note.subTitle;
              },
              color: kPrimaryColor,
              hint: note.subTitle,
              colorHint: Colors.grey[500],
              maxLine: 5,
            ),
            ColorListEdit(color: note.color, note: note),
          ],
        ),
      ),
    );
  }
}
