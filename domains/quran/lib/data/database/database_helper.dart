import 'package:dependencies/sqflite/sqflite.dart';
import 'package:quran/data/models/bookmark_verses_dto.dart';
import 'package:quran/data/models/last_read_surah_dto.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblLastReadSurah = 'lastReadSurah';
  static const String _tblBookmarkVerses = 'bookmarkVerses';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final dbPath = '$path/quran.db';

    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblLastReadSurah (
        id INTEGER PRIMARY KEY,
        number INTEGER,
        surah TEXT,
        numberOfVerses INTEGER,
        revelation TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE  $_tblBookmarkVerses (
        id INTEGER PRIMARY KEY,
        inSurah INTEGER,
        surah TEXT,
        audioUri TEXT,
        textArab TEXT,
        transliteration TEXT,
        translation TEXT
      );
    ''');
  }

  // LAST READ QURAN
  Future<int> insertLastReadQuran(LastReadSurahDTO lastRead) async {
    final db = await database;
    return await db!.insert(_tblLastReadSurah, lastRead.toJson());
  }

  Future<int> updateLastReadQuran(LastReadSurahDTO lastRead) async {
    final db = await database;
    return await db!
        .update(_tblLastReadSurah, lastRead.toJson(), where: 'id = 1');
  }

  Future<List<Map<String, dynamic>>> getLastReadQuran() async {
    final db = await database;
    final List<Map<String, dynamic>> result =
        await db!.query(_tblLastReadSurah, where: 'id = 1');

    return result;
  }

  // BOOKMARK VERSES
  Future<int> insertBookmarkVerses(BookmarkVersesDTO bookmark) async {
    final db = await database;
    return await db!.insert(_tblBookmarkVerses, bookmark.toJson());
  }

  Future<int> removeBookmarkVerses(BookmarkVersesDTO bookmark) async {
    final db = await database;
    return await db!.delete(
      _tblBookmarkVerses,
      where: 'id = ?',
      whereArgs: [bookmark.id],
    );
  }

  Future<List<Map<String, dynamic>>> getBookmarkVerses() async {
    final db = await database;
    return await db!.query(_tblBookmarkVerses);
  }

  Future<Map<String, dynamic>?> getBookmarkVerseById(int id) async {
    final db = await database;
    final result = await db!.query(
      _tblBookmarkVerses,
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? result.first : null;
  }
}
