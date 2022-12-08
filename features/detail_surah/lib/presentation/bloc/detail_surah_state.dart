import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:quran/domain/entities/detail_surah_entity.dart';

class DetailSurahState extends Equatable {
  final ViewData<DetailSurahEntity> statusDetailSurah;

  const DetailSurahState({required this.statusDetailSurah});

  DetailSurahState copyWith({ViewData<DetailSurahEntity>? statusDetailSurah}) {
    return DetailSurahState(
        statusDetailSurah: statusDetailSurah ?? this.statusDetailSurah);
  }

  @override
  List<Object?> get props => [statusDetailSurah];
}
