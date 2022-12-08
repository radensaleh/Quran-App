import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:quran/domain/entities/bookmark_verses_entity.dart';
import 'package:quran/domain/repositories/quran_repository.dart';

class GetBookmarkVersesUsecase {
  final QuranRepository repository;

  GetBookmarkVersesUsecase({required this.repository});

  Future<Either<FailureResponse, List<BookmarkVersesEntity>>> call() {
    return repository.getBookmarkVerses();
  }
}
