import 'package:dependencies/equatable/equatable.dart';

enum ViewState { initial, loading, error, hasData, noData }

extension ViewStateExtension on ViewState {
  bool get isLoading => this == ViewState.loading;

  bool get isInitial => this == ViewState.initial;

  bool get isError => this == ViewState.error;

  bool get isHasData => this == ViewState.hasData;

  bool get isNoData => this == ViewState.noData;
}

// ignore: must_be_immutable
class ViewData<T> extends Equatable {
  ViewState status;
  T? data;
  String message = "";

  ViewData._({
    required this.status,
    this.data,
    this.message = "",
  });

  factory ViewData.loaded({T? data}) {
    return ViewData._(status: ViewState.hasData, data: data);
  }

  factory ViewData.error({
    required String message,
  }) {
    return ViewData._(
      status: ViewState.error,
      message: message,
    );
  }

  factory ViewData.loading({required String message}) {
    return ViewData._(status: ViewState.loading, message: message);
  }

  factory ViewData.initial() {
    return ViewData._(status: ViewState.initial);
  }

  factory ViewData.noData({required String message}) {
    return ViewData._(status: ViewState.noData, message: message);
  }

  @override
  List<Object?> get props => [status, message, data];
}
