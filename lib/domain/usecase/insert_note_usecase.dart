import 'package:dartz/dartz.dart';
import 'package:mynotes/domain/repository/note_repository.dart';
import 'package:mynotes/utils/exception.dart';

import '../entities/note.dart';

class InsertNoteUsecase {
  final NoteRepository _noteRepository;

  InsertNoteUsecase(this._noteRepository);

  Future<Either<Failure, Note?>> execute(Note data) {
    return _noteRepository.insertToNote(data);
  }
}
