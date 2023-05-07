import 'package:mynotes/data/datasources/db/notes_database_helper.dart';
import 'package:mynotes/data/models/note_table.dart';
import 'package:mynotes/utils/exception.dart';
import '../../domain/entities/note.dart';

abstract class NoteLocalDataSource {
  Future<NoteTable?> insertNote(NoteTable note);
  Future<List<NoteTable>> getNoteList();
  Future<NoteTable?> getSingleNote(int id);
  Future<int> deleteNote(int id);
  Future<NoteTable?> updateNote(NoteTable note);
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

  @override
  Future<NoteTable?> getSingleNote(int id) async {
    final res = await notesDatabaseHelper.getNoteById(id);
    if (res != null) {
      return NoteTable.fromMap(res);
    } else {
      return null;
    }
  }

  @override
  Future<int> deleteNote(int id) async {
    try {
      final res = await notesDatabaseHelper.deleteNote(id);
      return res;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<NoteTable?> updateNote(NoteTable note) async {
    try {
      await notesDatabaseHelper.updateNote(note);
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
