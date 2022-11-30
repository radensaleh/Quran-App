import 'dart:convert';

import 'package:quran/data/models/surah_dto.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';

class DetailSurahResponseDTO {
  DetailSurahResponseDTO({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final DetailSurahDTO data;

  factory DetailSurahResponseDTO.fromRawJson(String str) =>
      DetailSurahResponseDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailSurahResponseDTO.fromJson(Map<String, dynamic> json) =>
      DetailSurahResponseDTO(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: DetailSurahDTO.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DetailSurahDTO {
  DetailSurahDTO({
    required this.number,
    required this.sequence,
    required this.numberOfVerses,
    required this.name,
    required this.revelation,
    required this.tafsir,
    required this.preBismillah,
    required this.verses,
  });

  final int number;
  final int sequence;
  final int numberOfVerses;
  final NameDTO name;
  final RevelationDTO revelation;
  final TafsirDTO tafsir;
  final dynamic preBismillah;
  final List<VerseDTO> verses;

  factory DetailSurahDTO.fromRawJson(String str) =>
      DetailSurahDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailSurahDTO.fromJson(Map<String, dynamic> json) => DetailSurahDTO(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: NameDTO.fromJson(json["name"]),
        revelation: RevelationDTO.fromJson(json["revelation"]),
        tafsir: TafsirDTO.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"],
        verses: List<VerseDTO>.from(
            json["verses"].map((x) => VerseDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
        "preBismillah": preBismillah,
        "verses": List<dynamic>.from(verses.map((x) => x.toJson())),
      };

  DetailSurahEntity toEntity() => DetailSurahEntity(
        number: number,
        sequence: sequence,
        numberOfVerses: numberOfVerses,
        name: name.toEntity(),
        revelation: revelation.toEntity(),
        tafsir: tafsir.toEntity(),
        preBismillah: preBismillah,
        verses: verses.map((verse) => verse.toEntity()).toList(),
      );
}

class VerseDTO {
  VerseDTO({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  final NumberDTO number;
  final MetaDTO meta;
  final TextDTO text;
  final TranslationDTO translation;
  final AudioDTO audio;
  final VerseTafsirDTO tafsir;

  factory VerseDTO.fromRawJson(String str) =>
      VerseDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerseDTO.fromJson(Map<String, dynamic> json) => VerseDTO(
        number: NumberDTO.fromJson(json["number"]),
        meta: MetaDTO.fromJson(json["meta"]),
        text: TextDTO.fromJson(json["text"]),
        translation: TranslationDTO.fromJson(json["translation"]),
        audio: AudioDTO.fromJson(json["audio"]),
        tafsir: VerseTafsirDTO.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number.toJson(),
        "meta": meta.toJson(),
        "text": text.toJson(),
        "translation": translation.toJson(),
        "audio": audio.toJson(),
        "tafsir": tafsir.toJson(),
      };

  VerseEntity toEntity() => VerseEntity(
        number: number.toEntity(),
        meta: meta.toEntity(),
        text: text.toEntity(),
        translation: translation.toEntity(),
        audio: audio.toEntity(),
        tafsir: tafsir.toEntity(),
      );
}

class AudioDTO {
  AudioDTO({
    required this.primary,
    required this.secondary,
  });

  final String primary;
  final List<String> secondary;

  factory AudioDTO.fromRawJson(String str) =>
      AudioDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AudioDTO.fromJson(Map<String, dynamic> json) => AudioDTO(
        primary: json["primary"],
        secondary: List<String>.from(json["secondary"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "primary": primary,
        "secondary": List<dynamic>.from(secondary.map((x) => x)),
      };

  AudioEntity toEntity() => AudioEntity(primary: primary, secondary: secondary);
}

class MetaDTO {
  MetaDTO({
    required this.juz,
    required this.page,
    required this.manzil,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  final int juz;
  final int page;
  final int manzil;
  final int ruku;
  final int hizbQuarter;
  final SajdaDTO sajda;

  factory MetaDTO.fromRawJson(String str) => MetaDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaDTO.fromJson(Map<String, dynamic> json) => MetaDTO(
        juz: json["juz"],
        page: json["page"],
        manzil: json["manzil"],
        ruku: json["ruku"],
        hizbQuarter: json["hizbQuarter"],
        sajda: SajdaDTO.fromJson(json["sajda"]),
      );

  Map<String, dynamic> toJson() => {
        "juz": juz,
        "page": page,
        "manzil": manzil,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda.toJson(),
      };

  MetaEntity toEntity() => MetaEntity(
        juz: juz,
        page: page,
        manzil: manzil,
        ruku: ruku,
        hizbQuarter: hizbQuarter,
        sajda: sajda.toEntity(),
      );
}

class SajdaDTO {
  SajdaDTO({
    required this.recommended,
    required this.obligatory,
  });

  final bool recommended;
  final bool obligatory;

  factory SajdaDTO.fromRawJson(String str) =>
      SajdaDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SajdaDTO.fromJson(Map<String, dynamic> json) => SajdaDTO(
        recommended: json["recommended"],
        obligatory: json["obligatory"],
      );

  Map<String, dynamic> toJson() => {
        "recommended": recommended,
        "obligatory": obligatory,
      };

  SajdaEntity toEntity() =>
      SajdaEntity(recommended: recommended, obligatory: obligatory);
}

class NumberDTO {
  NumberDTO({
    required this.inQuran,
    required this.inSurah,
  });

  final int inQuran;
  final int inSurah;

  factory NumberDTO.fromRawJson(String str) =>
      NumberDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NumberDTO.fromJson(Map<String, dynamic> json) => NumberDTO(
        inQuran: json["inQuran"],
        inSurah: json["inSurah"],
      );

  Map<String, dynamic> toJson() => {
        "inQuran": inQuran,
        "inSurah": inSurah,
      };

  NumberEntity toEntity() => NumberEntity(inQuran: inQuran, inSurah: inSurah);
}

class VerseTafsirDTO {
  VerseTafsirDTO({
    required this.id,
  });

  final IdDTO id;

  factory VerseTafsirDTO.fromRawJson(String str) =>
      VerseTafsirDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerseTafsirDTO.fromJson(Map<String, dynamic> json) => VerseTafsirDTO(
        id: IdDTO.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id.toJson(),
      };

  VerseTafsirEntity toEntity() => VerseTafsirEntity(id: id.toEntity());
}

class IdDTO {
  IdDTO({
    required this.short,
    required this.long,
  });

  final String short;
  final String long;

  factory IdDTO.fromRawJson(String str) => IdDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IdDTO.fromJson(Map<String, dynamic> json) => IdDTO(
        short: json["short"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
      };

  IdEntity toEntity() => IdEntity(short: short, long: long);
}

class TextDTO {
  TextDTO({
    required this.arab,
    required this.transliteration,
  });

  final String arab;
  final TransliterationDTO transliteration;

  factory TextDTO.fromRawJson(String str) => TextDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TextDTO.fromJson(Map<String, dynamic> json) => TextDTO(
        arab: json["arab"],
        transliteration: TransliterationDTO.fromJson(json["transliteration"]),
      );

  Map<String, dynamic> toJson() => {
        "arab": arab,
        "transliteration": transliteration.toJson(),
      };

  TextEntity toEntity() =>
      TextEntity(arab: arab, transliteration: transliteration.toEntity());
}

class TransliterationDTO {
  TransliterationDTO({
    required this.en,
  });

  final String en;

  factory TransliterationDTO.fromRawJson(String str) =>
      TransliterationDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransliterationDTO.fromJson(Map<String, dynamic> json) =>
      TransliterationDTO(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };

  TransliterationEntity toEntity() => TransliterationEntity(en: en);
}
