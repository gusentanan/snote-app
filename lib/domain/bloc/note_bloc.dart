import 'dart:async';

import 'package:mynotes/domain/bloc/note_events.dart';
import 'package:mynotes/domain/bloc/note_state.dart';

import 'package:bloc/bloc.dart';
import 'package:mynotes/domain/usecase/insert_note_usecase.dart';
import '../usecase/get_note_list_usecase.dart';
import '../usecase/get_single_note_usecase.dart';

class NoteBloc extends Bloc<NoteListEvent, NoteState> {
  final GetNoteListUsecase _getNoteList;
  final InsertNoteUsecase _insertNote;
  final GetSingleNoteUsecase _getSingleNote;

  NoteBloc(this._getNoteList, this._insertNote, this._getSingleNote)
      : super(NoteListInitial()) {
    on<OnGetNoteListEvent>(_onGetNoteList);
    on<AddNoteEvent>(_onInsertNote);
    on<OnGetSingleNote>(_onGetSingleNote);
  }

  FutureOr<void> _onGetNoteList(
      OnGetNoteListEvent event, Emitter<NoteState> emit) async {
    final res = await _getNoteList.execute();
    res.fold((failure) {
      emit(NoteError(failure.message));
    }, (success) {
      success.isEmpty ? emit(NoteListEmpty()) : emit(NoteListSuccess(success));
    });
  }

  FutureOr<void> _onInsertNote(
      AddNoteEvent event, Emitter<NoteState> emit) async {
    final note = event.note;

    final res = await _insertNote.execute(note);
    res.fold((failure) {
      emit(NoteError(failure.message));
    }, (success) {
      emit(NoteSuccess(note));
    });
  }

  FutureOr<void> _onGetSingleNote(
      OnGetSingleNote event, Emitter<NoteState> emit) async {
    final id = event.id;

    final res = await _getSingleNote.execute(id);
    res.fold((failure) {
      emit(NoteError(failure.message));
    }, (success) {
      if (success == null) {
        emit(NoteEmpty());
      } else {
        emit(NoteSuccess(success));
      }
    });
  }
}
