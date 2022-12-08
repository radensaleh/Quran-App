import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:quran/domain/usecases/get_detail_surah_usecase.dart';
import 'bloc.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final GetDetailSurahUsecase getDetailSurahUsecase;

  DetailSurahBloc({required this.getDetailSurahUsecase})
      : super(DetailSurahState(statusDetailSurah: ViewData.initial())) {
    on<FetchDetailSurah>(_detailSurahEvent);
  }

  void _detailSurahEvent(
    FetchDetailSurah event,
    Emitter emit,
  ) async {
    emit(state.copyWith(
        statusDetailSurah: ViewData.loading(message: 'Loading')));

    final response = await getDetailSurahUsecase.call(event.id);

    try {
      if (response.length() == 0) {
        emit(state.copyWith(
            statusDetailSurah: ViewData.noData(message: 'No Data')));
      } else {
        response.fold(
            (failure) => emit(state.copyWith(
                statusDetailSurah: ViewData.error(message: failure.message))),
            (data) => emit(state.copyWith(
                statusDetailSurah: ViewData.loaded(data: data))));
      }
    } catch (e) {
      emit(state.copyWith(
          statusDetailSurah: ViewData.error(message: e.toString())));
    }
  }
}
