import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran/domain/entities/surah_entity.dart';
import 'package:quran/domain/entities/juz_entity.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:common/utils/error/failure_response.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class QuranRepositoryImpl extends QuranRepository {
  final QuranRemoteDataSource remoteDataSource;

  QuranRepositoryImpl({required this.remoteDataSource});

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
}
