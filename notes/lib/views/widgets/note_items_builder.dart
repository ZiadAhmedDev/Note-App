import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes/cubit/note_view/cubit/note_view_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/note_view.dart';

class NotesBuilder extends StatelessWidget {
  const NotesBuilder({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
