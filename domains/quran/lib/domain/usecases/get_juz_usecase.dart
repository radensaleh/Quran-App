import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/juz_entity.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class GetJuzUsecase {
  final QuranRepository repository;

  const GetJuzUsecase({required this.repository});

  Future<Either<FailureResponse, JuzEntity>> call(int id) {
    return repository.getJuz(id);
  }
}
