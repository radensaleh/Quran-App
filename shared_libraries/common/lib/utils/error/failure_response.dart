import 'package:dependencies/equatable/equatable.dart';

class FailureResponse extends Equatable {
  final String message;

  const FailureResponse({required this.message});

  @override
  List<Object?> get props => [message];
}
