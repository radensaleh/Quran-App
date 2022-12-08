import 'package:dependencies/bloc/bloc.dart';
import 'package:dependencies/equatable/equatable.dart';

import 'package:quran/domain/entities/detail_surah_entity.dart';
import 'package:quran/domain/entities/last_read_surah_entity.dart';
import 'package:quran/domain/usecases/get_last_read_usecase.dart';
import 'package:quran/domain/usecases/save_last_read_usecase.dart';
import 'package:quran/domain/usecases/update_last_read_usecase.dart';

part 'last_read_state.dart';

class LastReadCubit extends Cubit<LastReadState> {
  final SaveLastReadUsecase saveLastReadUsecase;
  final UpdateLastReadUsecase updateLastReadUsecase;
  final GetLastReadUsecase getLastReadUsecase;

  LastReadCubit({
    required this.saveLastReadUsecase,
    required this.updateLastReadUsecase,
    required this.getLastReadUsecase,
  }) : super(const LastReadState(data: [], message: 'initial'));

  void getLastRead() async {
    final result = await getLastReadUsecase.call();

    result.fold(
        (failure) =>
            emit(LastReadState(data: const [], message: failure.message)),
        (data) => emit(LastReadState(data: data, message: 'Success Get Data')));
  }

  Future<void> addLastRead(DetailSurahEntity surah) async {
    final result = await saveLastReadUsecase.call(surah);

    result.fold(
        (failure) =>
            emit(LastReadState(data: const [], message: failure.message)),
        (data) => emit(LastReadState(data: const [], message: data)));
  }

  Future<void> updateLastRead(DetailSurahEntity surah) async {
    final result = await updateLastReadUsecase.call(surah);

    result.fold(
        (failure) =>
            emit(LastReadState(data: const [], message: failure.message)),
        (data) => emit(LastReadState(data: const [], message: data)));
  }
}
