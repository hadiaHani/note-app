part of 'add_note_cubit.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFauiler extends AddNoteState {
  final String errMessage;

  AddNoteFauiler(this.errMessage);
}
