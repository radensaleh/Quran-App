import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/bookmark_verses_entity.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:quran/domain/entities/juz_entity.dart';
import 'package:quran/domain/entities/last_read_surah_entity.dart';
import 'package:quran/domain/entities/surah_entity.dart';

abstract class QuranRepository {
  Future<Either<FailureResponse, List<SurahEntity>>> getAllSurah();
  Future<Either<FailureResponse, JuzEntity>> getJuz(int id);
  Future<Either<FailureResponse, DetailSurahEntity>> getDetailSurah(int id);
  // LAST READ QURAN
  Future<Either<FailureResponse, String>> saveLastReadQuran(
      DetailSurahEntity detailSurahEntity);
  Future<Either<FailureResponse, String>> updateLastReadQuran(
      DetailSurahEntity detailSurahEntity);
  Future<Either<FailureResponse, List<LastReadSurahEntity>>> getLastReadQuran();
  // BOOKMARK VERSES
  Future<Either<FailureResponse, String>> saveBookmarkVerses(
      VerseEntity verseEntity, String surah);
  Future<Either<FailureResponse, String>> removeBookmarkVerses(
      VerseEntity verseEntity, String surah);
  Future<Either<FailureResponse, List<BookmarkVersesEntity>>>
      getBookmarkVerses();
  Future<bool> isAddedBookmarkVerses(int id);
}
