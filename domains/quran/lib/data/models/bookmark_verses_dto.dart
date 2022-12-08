import 'package:quran/domain/entities/bookmark_verses_entity.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';

class BookmarkVersesDTO {
  final int id;
  final int inSurah;
  final String surah;
  final String audioUri;
  final String textArab;
  final String transliteration;
  final String translation;

  BookmarkVersesDTO({
    required this.id,
    required this.inSurah,
    required this.surah,
    required this.audioUri,
    required this.textArab,
    required this.transliteration,
    required this.translation,
  });

  factory BookmarkVersesDTO.fromEntity(VerseEntity verse, String surah) =>
      BookmarkVersesDTO(
        id: verse.number.inQuran,
        inSurah: verse.number.inSurah,
        surah: surah,
        audioUri: verse.audio.primary,
        textArab: verse.text.arab,
        transliteration: verse.text.transliteration.en,
        translation: verse.translation.id,
      );

  factory BookmarkVersesDTO.fromMap(Map<String, dynamic> map) =>
      BookmarkVersesDTO(
        id: map['id'],
        inSurah: map['inSurah'],
        surah: map['surah'],
        audioUri: map['audioUri'],
        textArab: map['textArab'],
        transliteration: map['transliteration'],
        translation: map['translation'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'inSurah': inSurah,
        'surah': surah,
        'audioUri': audioUri,
        'textArab': textArab,
        'transliteration': transliteration,
        'translation': translation,
      };

  BookmarkVersesEntity toEntity() {
    return BookmarkVersesEntity(
      id: id,
      inSurah: inSurah,
      surah: surah,
      audioUri: audioUri,
      textArab: textArab,
      transliteration: transliteration,
      translation: translation,
    );
  }
}
