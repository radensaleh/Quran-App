import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:quran/domain/usecases/get_surah_usecase.dart';
import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetSurahUsecase getSurahUsecase;

  HomeBloc({required this.getSurahUsecase})
      : super(HomeState(statusSurah: ViewData.initial())) {
    on<FetchSurah>(_fetchSurah);
  }

  void _fetchSurah(FetchSurah event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(statusSurah: ViewData.loading(message: 'Loading')));

      final response = await getSurahUsecase.call();

      if (response.length() == 0) {
        emit(state.copyWith(statusSurah: ViewData.noData(message: 'Kosong')));
      } else {
        response.fold(
            (failure) => emit(state.copyWith(
                statusSurah: ViewData.error(message: failure.message))),
            (data) =>
                emit(state.copyWith(statusSurah: ViewData.loaded(data: data))));
      }
    } catch (e) {
      emit(state.copyWith(statusSurah: ViewData.error(message: e.toString())));
    }
  }
}
