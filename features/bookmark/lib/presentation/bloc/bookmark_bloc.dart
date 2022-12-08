import 'package:bookmark/presentation/bloc/bloc.dart';
import 'package:common/utils/state/view_data_state.dart';

import 'package:dependencies/bloc/bloc.dart';
import 'package:quran/domain/usecases/get_bookmark_verses_usecase.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetBookmarkVersesUsecase getBookmarkVersesUsecase;

  BookmarkBloc({required this.getBookmarkVersesUsecase})
      : super(BookmarkState(statusBookmark: ViewData.initial())) {
    on<FetchBookmark>(_fetchBookmark);
  }

  void _fetchBookmark(FetchBookmark event, Emitter<BookmarkState> emit) async {
    try {
      emit(
          state.copyWith(statusBookmark: ViewData.loading(message: 'Loading')));

      final response = await getBookmarkVersesUsecase.call();

      response.fold(
          (failure) => emit(state.copyWith(
              statusBookmark: ViewData.error(message: failure.message))),
          (data) => emit(
              state.copyWith(statusBookmark: ViewData.loaded(data: data))));
    } catch (e) {
      emit(state.copyWith(
          statusBookmark: ViewData.error(message: e.toString())));
    }
  }
}
