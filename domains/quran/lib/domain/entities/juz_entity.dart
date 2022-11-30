import 'package:dependencies/equatable/equatable.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';

class JuzResponseEntity extends Equatable {
  const JuzResponseEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  final int code;
  final String status;
  final String message;
  final JuzEntity data;

  @override
  List<Object?> get props => [code, status, message, data];
}

class JuzEntity extends Equatable {
  const JuzEntity({
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
  final List<VerseEntity> verses;

  @override
  List<Object?> get props => [
        juz,
        juzStartSurahNumber,
        juzEndSurahNumber,
        juzStartInfo,
        juzEndInfo,
        totalVerses,
        verses
      ];
}
