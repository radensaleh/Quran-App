import 'package:quran/data/database/database_helper.dart';
import 'package:quran/data/models/bookmark_verses_dto.dart';
import 'package:quran/data/models/last_read_surah_dto.dart';

abstract class QuranLocalDataSource {
  // LAST READ QURAN
  Future<String> insertLastRead(LastReadSurahDTO lastRead);
  Future<String> updateLastRead(LastReadSurahDTO lastRead);
  Future<List<LastReadSurahDTO>> getLastRead();
  // BOOKMARK VERSES
  Future<String> insertBookmarkVerses(BookmarkVersesDTO bookmark);
  Future<String> removeBookmarkVerses(BookmarkVersesDTO bookmark);
  Future<List<BookmarkVersesDTO>> getBookmarkVerses();
  Future<BookmarkVersesDTO?> getBookmarkVerseById(int id);
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  final DatabaseHelper databaseHelper;

  QuranLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<LastReadSurahDTO>> getLastRead() async {
    final result = await databaseHelper.getLastReadQuran();
    return result.map((data) => LastReadSurahDTO.fromMap(data)).toList();
  }

  @override
  Future<String> insertLastRead(LastReadSurahDTO lastRead) async {
    try {
      await databaseHelper.insertLastReadQuran(lastRead);
      return 'Insert Last Read Quran';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateLastRead(LastReadSurahDTO lastRead) async {
    try {
      await databaseHelper.updateLastReadQuran(lastRead);
      return 'Update Last Read Quran';
    } catch (e) {
      rethrow;
    }
  }

  // BOOKMARK VERSES
  @override
  Future<List<BookmarkVersesDTO>> getBookmarkVerses() async {
    final result = await databaseHelper.getBookmarkVerses();
    return result.map((data) => BookmarkVersesDTO.fromMap(data)).toList();
  }

  @override
  Future<String> insertBookmarkVerses(BookmarkVersesDTO bookmark) async {
    try {
      await databaseHelper.insertBookmarkVerses(bookmark);
      return 'Insert Bookmark Verses';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> removeBookmarkVerses(BookmarkVersesDTO bookmark) async {
    try {
      await databaseHelper.removeBookmarkVerses(bookmark);
      return 'Remove Bookmark Verses';
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<BookmarkVersesDTO?> getBookmarkVerseById(int id) async {
    try {
      final result = await databaseHelper.getBookmarkVerseById(id);

      if (result != null) {
        return BookmarkVersesDTO.fromMap(result);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
