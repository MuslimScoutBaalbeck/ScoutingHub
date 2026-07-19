enum PageStatus { initial, loading, success, failure }
extension PageStatusX on PageStatus {
  bool get isInitial => this == PageStatus.initial;
  bool get isLoading => this == PageStatus.loading;
  bool get isSuccess => this == PageStatus.success;
  bool get isFailure => this == PageStatus.failure;
}