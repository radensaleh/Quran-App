import 'dart:convert';

import 'package:quran/data/models/detail_surah_dto.dart';
import 'package:quran/domain/entities/juz_entity.dart';

class JuzResponseDTO {
  JuzResponseDTO({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final JuzDTO data;

  factory JuzResponseDTO.fromRawJson(String str) =>
      JuzResponseDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JuzResponseDTO.fromJson(Map<String, dynamic> json) => JuzResponseDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: JuzDTO.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class JuzDTO {
  JuzDTO({
    required this.juz,
    required this.juzStartSurahNumber,
    required this.juzEndSurahNumber,
    required this.juzStartInfo,
    required this.juzEndInfo,
    required this.totalVerses,
    required this.verses,
  });

  final int juz;
  final int juzStartSurahNumber;
  final int juzEndSurahNumber;
  final String juzStartInfo;
  final String juzEndInfo;
  final int totalVerses;
  final List<VerseDTO> verses;

  factory JuzDTO.fromRawJson(String str) => JuzDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JuzDTO.fromJson(Map<String, dynamic> json) => JuzDTO(
        juz: json["juz"],
        juzStartSurahNumber: json["juzStartSurahNumber"],
        juzEndSurahNumber: json["juzEndSurahNumber"],
        juzStartInfo: json["juzStartInfo"],
        juzEndInfo: json["juzEndInfo"],
        totalVerses: json["totalVerses"],
        verses: List<VerseDTO>.from(
            json["verses"].map((x) => VerseDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "juzStartSurahNumber": juzStartSurahNumber,
        "juzEndSurahNumber": juzEndSurahNumber,
        "juzStartInfo": juzStartInfo,
        "juzEndInfo": juzEndInfo,
        "totalVerses": totalVerses,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };

  JuzEntity toEntity() => JuzEntity(
        juz: juz,
        juzStartSurahNumber: juzStartSurahNumber,
        juzEndSurahNumber: juzEndSurahNumber,
        juzStartInfo: juzStartInfo,
        juzEndInfo: juzEndInfo,
        totalVerses: totalVerses,
        verses: verses.map((verse) => verse.toEntity()).toList(),
      );
}
