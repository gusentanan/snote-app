import 'package:mynotes/data/datasources/db/notes_database_helper.dart';
import 'package:mynotes/data/models/note_table.dart';
import 'package:mynotes/utils/exception.dart';
import '../../domain/entities/note.dart';

abstract class NoteLocalDataSource {
  Future<NoteTable?> insertNote(NoteTable note);
  Future<List<NoteTable>> getNoteList();
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final NotesDatabaseHelper notesDatabaseHelper;

  NoteLocalDataSourceImpl({required this.notesDatabaseHelper});

  @override
  Future<List<NoteTable>> getNoteList() async {
    final res = await notesDatabaseHelper.getNoteList();
    return res.map((data) => NoteTable.fromMap(data)).toList();
  }

  @override
  Future<NoteTable?> insertNote(NoteTable note) async {
    try {
      await notesDatabaseHelper.insertNote(note);
      final res = await notesDatabaseHelper.getNoteById(note.id!);
      if (res != null) {
        return NoteTable.fromMap(res);
      } else {
        return null;
      }
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
