import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/data/data_sources/quran_local_data_source.dart';
import 'package:quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran/data/models/bookmark_verses_dto.dart';
import 'package:quran/data/models/last_read_surah_dto.dart';
import 'package:quran/domain/entities/bookmark_verses_entity.dart';
import 'package:quran/domain/entities/last_read_surah_entity.dart';
import 'package:quran/domain/entities/surah_entity.dart';
import 'package:quran/domain/entities/juz_entity.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl extends QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final QuranLocalDataSource localDataSource;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<FailureResponse, List<SurahEntity>>> getAllSurah() async {
    try {
      final result = await remoteDataSource.getAllSurah();
      return Right(result.map((model) => model.toEntity()).toList());
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, DetailSurahEntity>> getDetailSurah(
      int id) async {
    try {
      final result = await remoteDataSource.getDetailSurah(id);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, JuzEntity>> getJuz(int id) async {
    try {
      final result = await remoteDataSource.getJuz(id);
      return Right(result.toEntity());
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  // LOCAL DATA SOURCE
  // LAST READ QURAN
  @override
  Future<Either<FailureResponse, List<LastReadSurahEntity>>>
      getLastReadQuran() async {
    try {
      final result = await localDataSource.getLastRead();
      return Right(result.map((model) => model.toEntity()).toList());
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, String>> saveLastReadQuran(
      DetailSurahEntity detailSurahEntity) async {
    try {
      final result = await localDataSource
          .insertLastRead(LastReadSurahDTO.fromEntity(detailSurahEntity));
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, String>> updateLastReadQuran(
      DetailSurahEntity detailSurahEntity) async {
    try {
      final result = await localDataSource
          .updateLastRead(LastReadSurahDTO.fromEntity(detailSurahEntity));
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  // BOOKMARK VERSES
  @override
  Future<Either<FailureResponse, List<BookmarkVersesEntity>>>
      getBookmarkVerses() async {
    try {
      final result = await localDataSource.getBookmarkVerses();
      return Right(result.map((model) => model.toEntity()).toList());
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, String>> removeBookmarkVerses(
      VerseEntity verseEntity, String surah) async {
    try {
      final result = await localDataSource.removeBookmarkVerses(
          BookmarkVersesDTO.fromEntity(verseEntity, surah));
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, String>> saveBookmarkVerses(
      VerseEntity verseEntity, String surah) async {
    try {
      final result = await localDataSource.insertBookmarkVerses(
          BookmarkVersesDTO.fromEntity(verseEntity, surah));
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureResponse(message: e.toString()));
    }
  }

  @override
  Future<bool> isAddedBookmarkVerses(int id) async {
    final result = await localDataSource.getBookmarkVerseById(id);
    return result != null;
  }
}
