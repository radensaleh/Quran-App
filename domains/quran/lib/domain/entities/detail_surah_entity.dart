import 'package:dependencies/equatable/equatable.dart';
import 'package:quran/domain/entities/surah_entity.dart';

class DetailSurahResponseEntity extends Equatable {
  const DetailSurahResponseEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final DetailSurahEntity data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class DetailSurahEntity extends Equatable {
  const DetailSurahEntity({
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
  final NameEntity name;
  final RevelationEntity revelation;
  final TafsirEntity tafsir;
  final dynamic preBismillah;
  final List<VerseEntity> verses;

  @override
  List<Object?> get props => [
        number,
        sequence,
        numberOfVerses,
        name,
        revelation,
        preBismillah,
        verses
      ];
}

class VerseEntity extends Equatable {
  const VerseEntity({
    required this.number,
    required this.meta,
    required this.text,
    required this.translation,
    required this.audio,
    required this.tafsir,
  });

  final NumberEntity number;
  final MetaEntity? meta;
  final TextEntity text;
  final TranslationEntity translation;
  final AudioEntity audio;
  final VerseTafsirEntity? tafsir;

  @override
  List<Object?> get props => [number, meta, text, translation, audio, tafsir];
}

class AudioEntity extends Equatable {
  const AudioEntity({
    required this.primary,
    required this.secondary,
  });

  final String primary;
  final List<String> secondary;

  @override
  List<Object?> get props => [primary, secondary];
}

class MetaEntity extends Equatable {
  const MetaEntity({
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
  final SajdaEntity sajda;

  @override
  List<Object?> get props => [juz, page, manzil, ruku, hizbQuarter, sajda];
}

class SajdaEntity extends Equatable {
  const SajdaEntity({
    required this.recommended,
    required this.obligatory,
  });

  final bool recommended;
  final bool obligatory;

  @override
  List<Object?> get props => [recommended, obligatory];
}

class NumberEntity extends Equatable {
  const NumberEntity({
    required this.inQuran,
    required this.inSurah,
  });

  final int inQuran;
  final int inSurah;

  @override
  List<Object?> get props => [inQuran, inSurah];
}

class VerseTafsirEntity extends Equatable {
  const VerseTafsirEntity({
    required this.id,
  });

  final IdEntity id;

  @override
  List<Object?> get props => [id];
}

class IdEntity extends Equatable {
  const IdEntity({
    required this.short,
    required this.long,
  });

  final String short;
  final String long;

  @override
  List<Object?> get props => [short, long];
}

class TextEntity extends Equatable {
  const TextEntity({
    required this.arab,
    required this.transliteration,
  });

  final String arab;
  final TransliterationEntity transliteration;

  @override
  List<Object?> get props => [arab, transliteration];
}

class TransliterationEntity extends Equatable {
  const TransliterationEntity({
    required this.en,
  });

  final String en;

  @override
  List<Object?> get props => [en];
}
