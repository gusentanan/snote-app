import 'package:dartz/dartz.dart';
import 'package:mynotes/domain/repository/note_repository.dart';

import '../../utils/exception.dart';
import '../entities/note.dart';

class UpdateNoteUsecase {
  final NoteRepository _noteRepository;

  UpdateNoteUsecase(this._noteRepository);

  Future<Either<Failure, Note?>> execute(Note note) {
    return _noteRepository.updateNote(note);
  }
}
