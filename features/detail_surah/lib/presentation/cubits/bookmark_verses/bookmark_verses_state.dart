part of 'bookmark_verses_cubit.dart';

class BookmarkVersesState extends Equatable {
  final bool isBookmark;
  final String message;

  const BookmarkVersesState({required this.isBookmark, required this.message});

  @override
  List<Object?> get props => [isBookmark, message];
}
