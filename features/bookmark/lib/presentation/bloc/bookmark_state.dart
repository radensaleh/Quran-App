import 'package:common/utils/state/view_data_state.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:quran/domain/entities/bookmark_verses_entity.dart';

class BookmarkState extends Equatable {
  final ViewData<List<BookmarkVersesEntity>> statusBookmark;

  const BookmarkState({required this.statusBookmark});

  BookmarkState copyWith(
      {ViewData<List<BookmarkVersesEntity>>? statusBookmark}) {
    return BookmarkState(statusBookmark: statusBookmark ?? this.statusBookmark);
  }

  @override
  List<Object?> get props => [statusBookmark];
}
