import 'package:dependencies/get_it/get_it.dart';
import 'package:quran/data/data_sources/quran_remote_data_source.dart';
import 'package:quran/data/repositories/quran_repository_impl.dart';
import 'package:quran/domain/repositories/quran_repository.dart';
import 'package:quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:quran/domain/usecases/get_juz_usecase.dart';
import 'package:quran/domain/usecases/get_surah_usecase.dart';

class RegisterQuranModule {
  RegisterQuranModule() {
    _registerCore();
  }

  void _registerCore() {
    /// Remote Data Source
    sl.registerLazySingleton<QuranRemoteDataSource>(
        () => QuranRemoteDataSourceImpl(dio: sl()));

    /// Repository
    sl.registerLazySingleton<QuranRepository>(
        () => QuranRepositoryImpl(remoteDataSource: sl()));

    /// Use Case
    sl.registerLazySingleton<GetSurahUsecase>(
        () => GetSurahUsecase(repository: sl()));

    sl.registerLazySingleton<GetDetailSurahUsecase>(
        () => GetDetailSurahUsecase(repository: sl()));

    sl.registerLazySingleton<GetJuzUsecase>(
        () => GetJuzUsecase(repository: sl()));
  }
}
