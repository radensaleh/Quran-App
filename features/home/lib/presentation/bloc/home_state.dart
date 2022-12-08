import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:quran/domain/entities/surah_entity.dart';

class HomeState extends Equatable {
  final ViewData<List<SurahEntity>> statusSurah;

  const HomeState({required this.statusSurah});

  HomeState copyWith({ViewData<List<SurahEntity>>? statusSurah}) {
    return HomeState(statusSurah: statusSurah ?? this.statusSurah);
  }

  @override
  List<Object?> get props => [statusSurah];
}
