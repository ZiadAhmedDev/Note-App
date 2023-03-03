part of 'add_note_cubit.dart';

@immutable
abstract class AddTheNotetate {}

class AddNoteInitial extends AddTheNotetate {}

class AddNoteLoading extends AddTheNotetate {}

class AddTheNoteuccess extends AddTheNotetate {}

class AddNoteFailure extends AddTheNotetate {
  final String? error;
  AddNoteFailure(this.error);
}
