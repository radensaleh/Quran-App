import 'package:dependencies/equatable/equatable.dart';

class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object?> get props => [];
}

class FetchBookmark extends BookmarkEvent {}
