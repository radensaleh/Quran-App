import 'package:dependencies/get_it/get_it.dart';
import 'package:quran/data/data_sources/quran_local_data_source.dart';
import 'package:quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran/data/database/database_helper.dart';
import 'package:quran/data/repositories/quran_repository_impl.dart';
import 'package:quran/domain/repositories/quran_repository.dart';
import 'package:quran/domain/usecases/get_bookmark_verses_usecase.dart';
import 'package:quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:quran/domain/usecases/get_juz_usecase.dart';
import 'package:quran/domain/usecases/get_last_read_usecase.dart';
import 'package:quran/domain/usecases/get_surah_usecase.dart';
import 'package:quran/domain/usecases/remove_bookmark_verses_usecase.dart';
import 'package:quran/domain/usecases/save_bookmark_verses_usecase.dart';
import 'package:quran/domain/usecases/save_last_read_usecase.dart';
import 'package:quran/domain/usecases/status_bookmark_verse_usecase.dart';
import 'package:quran/domain/usecases/update_last_read_usecase.dart';

class RegisterQuranModule {
  RegisterQuranModule() {
    _registerCore();
  }

  void _registerCore() {
    /// Database
    sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

    /// Remote Data Source
    sl.registerLazySingleton<QuranRemoteDataSource>(
        () => QuranRemoteDataSourceImpl(dio: sl()));

    /// Local Data Source
    sl.registerLazySingleton<QuranLocalDataSource>(
        () => QuranLocalDataSourceImpl(databaseHelper: sl()));

    /// Repository
    sl.registerLazySingleton<QuranRepository>(() =>
        QuranRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

    /// Use Case
    sl.registerLazySingleton<GetSurahUsecase>(
        () => GetSurahUsecase(repository: sl()));

    sl.registerLazySingleton<GetDetailSurahUsecase>(
        () => GetDetailSurahUsecase(repository: sl()));

    sl.registerLazySingleton<GetJuzUsecase>(
        () => GetJuzUsecase(repository: sl()));

    sl.registerLazySingleton<SaveLastReadUsecase>(
        () => SaveLastReadUsecase(repository: sl()));

    sl.registerLazySingleton<UpdateLastReadUsecase>(
        () => UpdateLastReadUsecase(repository: sl()));

    sl.registerLazySingleton<GetLastReadUsecase>(
        () => GetLastReadUsecase(repository: sl()));

    sl.registerLazySingleton<SaveBookmarkVersesUseCase>(
        () => SaveBookmarkVersesUseCase(repository: sl()));

    sl.registerLazySingleton<RemoveBookmarkVersesUsecase>(
        () => RemoveBookmarkVersesUsecase(repository: sl()));

    sl.registerLazySingleton<GetBookmarkVersesUsecase>(
        () => GetBookmarkVersesUsecase(repository: sl()));

    sl.registerLazySingleton<StatusBookmarkVerseUsecase>(
        () => StatusBookmarkVerseUsecase(repository: sl()));
  }
}
