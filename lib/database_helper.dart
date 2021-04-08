import 'package:path/path.dart';
import 'package:note_taking_app/Models/note.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final _dbName = 'notes.db';
  static final _dbVersion = 1;

  static final table = 'notes_table';

  static final columnId = '_id';
  static final columnTitle = 'noteTitle';
  static final columnText = 'noteText';

  DBHelper._();

  static final DBHelper instance = DBHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTitle TEXT NOT NULL,
      $columnText TEXT
      )
      ''');
  }

  //Helper methods

  Future<int> insertNote(Note note) async {
    Database db = await instance.database;
    final int result = await db.insert(table, note.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> getNoteMap() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(table);
    return result;
  }

  Future<List<Note>> getNoteList() async {
    final List<Map<String, dynamic>> noteMap = await getNoteMap();
    List<Note> notesList = [];

    noteMap.forEach((note) {
      notesList.add(Note.fromMap(note));
    });
    return notesList;
  }

  Future<int> deleteNote(String noteTitle) async {
    Database db = await instance.database;
    return await db
        .delete(table, where: '$columnTitle = ?', whereArgs: [noteTitle]);
  }

  Future<int> updateNote(Note newNote, String oldNoteName) async {
    Database db = await instance.database;
    final result = await db.update(table, newNote.toMap(),
        where: '$columnTitle = ?', whereArgs: [oldNoteName]);
    return result;
  }

  // Future<void> deleteTable() async {
  //   Database db = await instance.database;
  //
  //   await db.execute('''DROP TABLE IF EXISTS $table''');
  //
  //   await db.execute('''
  //     CREATE TABLE $table (
  //     $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  //     $columnTitle TEXT NOT NULL,
  //     $columnText TEXT NOT NULL
  //     )
  //     ''');
  // }
}
