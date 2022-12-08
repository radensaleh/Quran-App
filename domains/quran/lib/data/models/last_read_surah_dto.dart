import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:quran/domain/entities/last_read_surah_entity.dart';

class LastReadSurahDTO {
  final int id;
  final int number;
  final String surah;
  final int numberOfVerses;
  final String revelation;

  LastReadSurahDTO({
    required this.id,
    required this.number,
    required this.surah,
    required this.numberOfVerses,
    required this.revelation,
  });

  factory LastReadSurahDTO.fromEntity(DetailSurahEntity detailSurah) =>
      LastReadSurahDTO(
        id: 1,
        number: detailSurah.number,
        surah: detailSurah.name.transliteration.id,
        numberOfVerses: detailSurah.numberOfVerses,
        revelation: detailSurah.revelation.id,
      );

  factory LastReadSurahDTO.fromMap(Map<String, dynamic> map) =>
      LastReadSurahDTO(
        id: map['id'],
        number: map['number'],
        surah: map['surah'],
        numberOfVerses: map['numberOfVerses'],
        revelation: map['revelation'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'surah': surah,
        'numberOfVerses': numberOfVerses,
        'revelation': revelation,
      };

  LastReadSurahEntity toEntity() {
    return LastReadSurahEntity(
      id: id,
      number: number,
      surah: surah,
      numberOfVerses: numberOfVerses,
      revelation: revelation,
    );
  }
}
