import 'package:dartz/dartz.dart';
import 'package:mynotes/data/datasources/note_local_datasource.dart';
import 'package:mynotes/data/models/note_table.dart';

import '../../utils/exception.dart';
import '../entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getNoteList();
  Future<Either<Failure, Note?>> insertToNote(Note data);
}

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryImpl({required this.noteLocalDataSource});

  @override
  Future<Either<Failure, List<Note>>> getNoteList() async {
    final res = await noteLocalDataSource.getNoteList();
    return Right(res.map((data) => data.toEntity()).toList());
  }

  @override
  Future<Either<Failure, Note?>> insertToNote(Note data) async {
    try {
      final res =
          await noteLocalDataSource.insertNote(NoteTable.fromEntity(data));
      return Right(res?.toEntity());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.msg));
    } catch (e) {
      throw e;
    }
  }
}
