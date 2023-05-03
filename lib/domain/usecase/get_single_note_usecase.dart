import 'package:dartz/dartz.dart';
import 'package:mynotes/domain/repository/note_repository.dart';

import '../../utils/exception.dart';
import '../entities/note.dart';

class GetSingleNoteUsecase {
  final NoteRepository _noteRepository;

  GetSingleNoteUsecase(this._noteRepository);

  Future<Either<Failure, Note?>> execute(id) {
    return _noteRepository.getSingleNote(id);
  }
}
