import 'package:dartz/dartz.dart';
import 'package:mynotes/domain/repository/note_repository.dart';
import 'package:mynotes/utils/exception.dart';

import '../entities/note.dart';

class GetNoteListUsecase {
  final NoteRepository _noteRepository;

  GetNoteListUsecase(this._noteRepository);

  Future<Either<Failure, List<Note>>> execute() {
    return _noteRepository.getNoteList();
  }
}
