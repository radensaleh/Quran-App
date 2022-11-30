import 'package:core/network/dio_handler.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/get_it/get_it.dart';

class RegisterCoreModule {
  RegisterCoreModule() {
    _init();
  }

  void _init() {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(
        () => DioHandler(baseUrl: 'https://jsonplaceholder.typicode.com'));
  }
}
