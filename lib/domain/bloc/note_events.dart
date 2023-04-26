import 'package:equatable/equatable.dart';

import '../entities/note.dart';

abstract class NoteListEvent extends Equatable {}

class OnGetNoteListEvent extends NoteListEvent {
  OnGetNoteListEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddNoteEvent extends NoteListEvent {
  final Note note;
  AddNoteEvent(this.note);

  @override
  // TODO: implement props
  List<Object?> get props => [note];
}
