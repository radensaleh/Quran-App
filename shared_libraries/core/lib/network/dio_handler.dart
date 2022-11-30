import 'package:core/network/api_interceptors.dart';
import 'package:dependencies/dio/dio.dart';

class DioHandler {
  final String baseUrl;

  DioHandler({required this.baseUrl});

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    options.headers = _defaultHeader();
    final dio = Dio(options);
    dio.interceptors.add(ApiInterceptors());

    return dio;
  }

  Dio get dio => _getDio();

  Map<String, dynamic> _defaultHeader() {
    Map<String, String> headers = {};
    headers['Content-Type'] = 'application/json';
    return headers;
  }
}
