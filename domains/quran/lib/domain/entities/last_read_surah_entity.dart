import 'package:dependencies/equatable/equatable.dart';

class LastReadSurahEntity extends Equatable {
  final int id;
  final int number;
  final String surah;
  final int numberOfVerses;
  final String revelation;

  const LastReadSurahEntity({
    required this.id,
    required this.number,
    required this.surah,
    required this.numberOfVerses,
    required this.revelation,
  });

  @override
  List<Object?> get props => [
        id,
        number,
        surah,
        numberOfVerses,
        revelation,
      ];
}
