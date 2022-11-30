import 'dart:convert';

import 'package:quran/domain/entities/surah_entity.dart';

class SurahResponseDTO {
  SurahResponseDTO({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final List<SurahDTO> data;

  factory SurahResponseDTO.fromRawJson(String str) =>
      SurahResponseDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurahResponseDTO.fromJson(Map<String, dynamic> json) =>
      SurahResponseDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data:
            List<SurahDTO>.from(json["data"].map((x) => SurahDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SurahDTO {
  SurahDTO({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
  });

  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameDTO name;
  final RevelationDTO revelation;
  final TafsirDTO tafsir;

  factory SurahDTO.fromRawJson(String str) =>
      SurahDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurahDTO.fromJson(Map<String, dynamic> json) => SurahDTO(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameDTO.fromJson(json["name"]),
        revelation: RevelationDTO.fromJson(json["revelation"]),
        tafsir: TafsirDTO.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
      };

  SurahEntity toEntity() => SurahEntity(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name.toEntity(),
        revelation: revelation.toEntity(),
        tafsir: tafsir.toEntity(),
      );
}

class NameDTO {
  NameDTO({
    required this.short,
    required this.long,
    required this.transliteration,
    required this.translation,
  });

  final String short;
  final String long;
  final TranslationDTO transliteration;
  final TranslationDTO translation;

  factory NameDTO.fromRawJson(String str) => NameDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NameDTO.fromJson(Map<String, dynamic> json) => NameDTO(
        short: json["short"],
        long: json["long"],
        transliteration: TranslationDTO.fromJson(json["transliteration"]),
        translation: TranslationDTO.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration.toJson(),
        "translation": translation.toJson(),
      };

  NameEntity toEntity() => NameEntity(
        short: short,
        long: long,
        transliteration: transliteration.toEntity(),
        translation: translation.toEntity(),
      );
}

class TranslationDTO {
  TranslationDTO({
    required this.en,
    required this.id,
  });

  final String en;
  final String id;

  factory TranslationDTO.fromRawJson(String str) =>
      TranslationDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TranslationDTO.fromJson(Map<String, dynamic> json) => TranslationDTO(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };

  TranslationEntity toEntity() => TranslationEntity(en: en, id: id);
}

class RevelationDTO {
  RevelationDTO({
    required this.arab,
    required this.en,
    required this.id,
  });

  final String arab;
  final String en;
  final String id;

  factory RevelationDTO.fromRawJson(String str) =>
      RevelationDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RevelationDTO.fromJson(Map<String, dynamic> json) => RevelationDTO(
        arab: json["arab"],
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "en": en,
        "id": id,
      };

  RevelationEntity toEntity() => RevelationEntity(arab: arab, en: en, id: id);
}

class TafsirDTO {
  TafsirDTO({
    required this.id,
  });

  final String id;

  factory TafsirDTO.fromRawJson(String str) =>
      TafsirDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TafsirDTO.fromJson(Map<String, dynamic> json) => TafsirDTO(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };

  TafsirEntity toEntity() => TafsirEntity(id: id);
}
