import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:TheNote/constants/const.dart';
import 'package:TheNote/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddTheNotetate> {
  AddNoteCubit() : super(AddNoteInitial());

  static AddNoteCubit get(context) => BlocProvider.of(context);

  Color color = Colors.red;
  void addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNoteBox);
      note.color = color.value;
      await noteBox.add(note);
      emit(AddTheNoteuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
