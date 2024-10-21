import 'package:flutter_application_1/services/storage/crud_exceptions.dart';
import 'package:flutter_application_1/services/storage/note_model.dart';
import 'package:flutter_application_1/services/storage/storage_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class StorageService {
// Making the service as singleton
  StorageService._privateConstructor();
  static final StorageService _singleton = StorageService._privateConstructor();
  factory StorageService() => _singleton;

  Database? _db;
  List<NoteModel> _notes = [];

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) throw DatabaseIsNotOpen();
    return db;
  }

  Future<void> createNote(NoteModel note) async {
    final db = _getDatabaseOrThrow();
    final id = await db.insert(tableName, note.toRow());
    if (id == 0) CouldNotUpdateNote();
  }

  Future<NoteModel> readNote(int id) async {
    final db = _getDatabaseOrThrow();
    final result = await db.query(
      tableName,
      where: 'columnId = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isEmpty) throw CouldNotFindNote();

    return NoteModel.fromRow(result.first);
  }

  Future<List<NoteModel>> readAllNotes(int id) async {
    final db = _getDatabaseOrThrow();
    final result = await db.query(tableName);
    if (result.isEmpty) throw CouldNotFindNote();
    return result.map((note) => NoteModel.fromRow(note)).toList();
  }

  Future<void> updateNote(NoteModel note) async {
    final db = _getDatabaseOrThrow();
    final n = await db.update(
      tableName,
      note.toRow(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
    if (n != 1) throw CouldNotUpdateNote();
  }

  Future<void> deleteNote(int id) async {
    final db = _getDatabaseOrThrow();
    final n = await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
    if (n != 1) throw CouldNotDeleteNote();
  }

  Future<int> deleteAllNotes() async {
    final db = _getDatabaseOrThrow();
    final n = await db.delete(tableName);
    if (n == 0) throw CouldNotDeleteNote();
    return n;
  }

  Future<void> open() async {
    try {
      final appDocsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(appDocsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      await db.execute(noteTableString);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectory();
    }
  }

  Future<void> close() async {
    final db = _getDatabaseOrThrow();
    await db.close();
    _db = null;
  }
}
