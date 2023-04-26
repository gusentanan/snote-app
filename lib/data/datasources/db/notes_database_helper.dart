import 'package:sqflite/sqflite.dart';

import '../../models/note_table.dart';

class NotesDatabaseHelper {
  static NotesDatabaseHelper? _notesDatabaseHelper;
  NotesDatabaseHelper._instance() {
    _notesDatabaseHelper = this;
  }

  factory NotesDatabaseHelper() =>
      _notesDatabaseHelper ?? NotesDatabaseHelper._instance();

  static Database? _database;
  static const String _tableNotes = 'notes';

  Future<Database?> get database async {
    _database ??= await _initDB();
    return _database;
  }

  Future<Database?> _initDB() async {
    final path = await getDatabasesPath();
    final dbPath = '$path/my_notes.db';

    final db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tableNotes (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        tier INTEGER
      );
    ''');
  }

  Future<int> insertNote(NoteTable note) async {
    final db = await database;
    return await db!.insert(_tableNotes, note.toMap());
  }

  Future<List<Map<String, dynamic>>> getNoteList() async {
    final db = await database;
    final List<Map<String, dynamic>> res = await db!.query(_tableNotes);

    return res;
  }

  Future<Map<String, dynamic>?> getNoteById(int id) async {
    final db = await database;
    final res = await db!.query(
      _tableNotes,
      where: 'id=?',
      whereArgs: [id],
    );

    if (res.isNotEmpty) {
      return res.first;
    } else {
      return null;
    }
  }
}
