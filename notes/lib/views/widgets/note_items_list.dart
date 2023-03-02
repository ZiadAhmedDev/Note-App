import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/model/note_model.dart';
import '../../cubit/add_note/add_note_cubit.dart';
import '../../cubit/note_view/cubit/note_view_cubit.dart';
import '../edit_note_view.dart';
import 'note_items_builder.dart';

class NoteItemList extends StatelessWidget {
  const NoteItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteViewCubit, NoteViewState>(
      builder: (context, state) {
        List<NoteModel> notes = NoteViewCubit.get(context).noteList ?? [];
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditNotePage(),
                    ));
              },
              child: NotesBuilder(
                note: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}
