import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class UpdateLastReadUsecase {
  final QuranRepository repository;

  const UpdateLastReadUsecase({required this.repository});

  Future<Either<FailureResponse, String>> call(
      DetailSurahEntity detailSurahEntity) {
    return repository.updateLastReadQuran(detailSurahEntity);
  }
}
