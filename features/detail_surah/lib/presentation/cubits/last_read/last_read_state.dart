part of 'last_read_cubit.dart';

class LastReadState extends Equatable {
  final List<LastReadSurahEntity> data;
  final String message;

  const LastReadState({required this.data, required this.message});

  @override
  List<Object?> get props => [data, message];
}
