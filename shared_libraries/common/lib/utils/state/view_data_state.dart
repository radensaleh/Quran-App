import 'package:common/utils/error/failure_response.dart';

enum ViewState { initial, loading, error, hasData, noData }

extension ViewStateExtention on ViewState {
  bool get isInitial => this == ViewState.initial;
  bool get isLoading => this == ViewState.loading;
  bool get isError => this == ViewState.error;
  bool get isHasData => this == ViewState.hasData;
  bool get isNoData => this == ViewState.noData;
}

class ViewData<T> {
  ViewState status;
  T? data;
  String message = "";
  FailureResponse? failureResponse;

  ViewData({
    required this.status,
    this.data,
    this.message = "",
    this.failureResponse,
  });

  factory ViewData.initial() {
    return ViewData(status: ViewState.initial);
  }

  factory ViewData.loading({required String message}) {
    return ViewData(status: ViewState.loading, message: message);
  }

  factory ViewData.loaded({T? data}) {
    return ViewData(status: ViewState.hasData, data: data);
  }

  factory ViewData.error({
    required FailureResponse? failureResponse,
    required String message,
  }) {
    return ViewData(
      status: ViewState.error,
      failureResponse: failureResponse,
      message: message,
    );
  }

  factory ViewData.noData({required String message}) {
    return ViewData(status: ViewState.noData, message: message);
  }
}
