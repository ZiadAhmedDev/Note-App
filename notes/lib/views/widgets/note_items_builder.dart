import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:TheNote/cubit/note_view/cubit/note_view_cubit.dart';
import 'package:TheNote/model/note_model.dart';
import 'package:TheNote/views/note_view.dart';

import '../edit_note_view.dart';

class TheNoteBuilder extends StatelessWidget {
  const TheNoteBuilder({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotePage(note: note),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      note.title,
                      style: const TextStyle(fontSize: 23, color: Colors.black),
                    ),
                  ),
                  subtitle: Text(
                    note.subTitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      NoteViewCubit.get(context).fetchNoteView();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    note.date,
                    style: const TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
