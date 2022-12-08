import 'package:dependencies/equatable/equatable.dart';

class DetailSurahEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDetailSurah extends DetailSurahEvent {
  final int id;

  FetchDetailSurah({required this.id});

  @override
  List<Object?> get props => [id];
}
