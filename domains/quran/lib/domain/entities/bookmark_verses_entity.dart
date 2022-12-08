import 'package:dependencies/equatable/equatable.dart';

class BookmarkVersesEntity extends Equatable {
  final int id;
  final int inSurah;
  final String surah;
  final String audioUri;
  final String textArab;
  final String transliteration;
  final String translation;

  const BookmarkVersesEntity({
    required this.id,
    required this.inSurah,
    required this.surah,
    required this.audioUri,
    required this.textArab,
    required this.transliteration,
    required this.translation,
  });

  @override
  List<Object?> get props => [
        id,
        inSurah,
        surah,
        audioUri,
        textArab,
        transliteration,
        translation,
      ];
}
