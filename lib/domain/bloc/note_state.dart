import 'package:equatable/equatable.dart';

import '../entities/note.dart';

abstract class NoteState extends Equatable {}

class NoteListInitial extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteListSuccess extends NoteState {
  final List<Note> noteList;

  NoteListSuccess(this.noteList);

  @override
  List<Object?> get props => [noteList];
}

class NoteError extends NoteState {
  final String msg;

  NoteError(this.msg);

  @override
  List<Object?> get props => [msg];
}

class NoteListEmpty extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteSuccess extends NoteState {
  final Note note;

  NoteSuccess(this.note);

  @override
  List<Object?> get props => [note];
}

class NoteDeleteSuccess extends NoteState {
  final int code;

  NoteDeleteSuccess(this.code);

  @override
  List<Object?> get props => [code];
}

class NoteEmpty extends NoteState {
  @override
  List<Object?> get props => [];
}
