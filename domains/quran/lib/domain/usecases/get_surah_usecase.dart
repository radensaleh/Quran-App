import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/surah_entity.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class GetSurahUsecase {
  final QuranRepository repository;

  const GetSurahUsecase({required this.repository});

  Future<Either<FailureResponse, List<SurahEntity>>> call() {
    return repository.getAllSurah();
  }
}
