import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../constants/const.dart';
import '../../../model/note_model.dart';

part 'note_view_state.dart';

class NoteViewCubit extends Cubit<NoteViewState> {
  NoteViewCubit() : super(NoteViewInitial());

  static NoteViewCubit get(context) => BlocProvider.of(context);

  List<NoteModel>? noteList;
  void fetchNoteView() {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    noteList = noteBox.values.toList();
    emit(NoteViewSuccess());
  }
}
