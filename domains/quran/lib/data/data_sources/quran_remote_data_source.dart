import 'package:dependencies/dio/dio.dart';
import 'package:quran/data/models/detail_surah_dto.dart';
import 'package:quran/data/models/juz_dto.dart';
import 'package:quran/data/models/surah_dto.dart';
import 'package:resources/constant/api_constant.dart';

abstract class QuranRemoteDataSource {
  Future<List<SurahDTO>> getAllSurah();
  Future<DetailSurahDTO> getDetailSurah(int id);
  Future<JuzDTO> getJuz(int id);
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final Dio dio;

  QuranRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<SurahDTO>> getAllSurah() async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}surah');
      return SurahResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DetailSurahDTO> getDetailSurah(int id) async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}surah/$id');
      return DetailSurahResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<JuzDTO> getJuz(int id) async {
    try {
      final response = await dio.get('${ApiConstant.baseUrl}juz/$id');
      return JuzResponseDTO.fromJson(response.data).data;
    } catch (e) {
      rethrow;
    }
  }
}
