import 'package:dartz/dartz.dart';
import 'package:mynotes/domain/repository/note_repository.dart';

import '../../utils/exception.dart';
import '../entities/note.dart';

class DeleteNoteUsecase {
  final NoteRepository _noteRepository;

  DeleteNoteUsecase(this._noteRepository);

  Future<Either<Failure, int>> execute(int id) {
    return _noteRepository.deleteNote(id);
  }
}
