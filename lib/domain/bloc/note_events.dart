import 'package:equatable/equatable.dart';

import '../entities/note.dart';

abstract class NoteListEvent extends Equatable {}

class OnGetNoteListEvent extends NoteListEvent {
  OnGetNoteListEvent();

  @override
  List<Object?> get props => [];
}

class AddNoteEvent extends NoteListEvent {
  final Note note;
  AddNoteEvent(this.note);

  @override
  List<Object?> get props => [note];
}

class OnGetSingleNote extends NoteListEvent {
  final int? id;

  OnGetSingleNote(this.id);

  @override
  List<Object?> get props => [];
}
