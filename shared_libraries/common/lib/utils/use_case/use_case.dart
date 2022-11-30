import 'package:common/utils/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/equatable/equatable.dart';

abstract class UseCase<T, Params> {
  const UseCase();

  Future<Either<FailureResponse, T>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
