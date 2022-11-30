import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:quran/domain/entities/juz_entity.dart';
import 'package:quran/domain/entities/surah_entity.dart';

abstract class QuranRepository {
  Future<Either<FailureResponse, List<SurahEntity>>> getAllSurah();
  Future<Either<FailureResponse, JuzEntity>> getJuz(int id);
  Future<Either<FailureResponse, DetailSurahEntity>> getDetailSurah(int id);
}
