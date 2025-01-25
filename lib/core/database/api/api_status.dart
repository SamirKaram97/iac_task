enum APIStatus {
  none,
  loading,
  success,
  error,
}

extension APIStatusExtension on APIStatus {
  bool get isLoading => this == APIStatus.loading;

  bool get isNone => this == APIStatus.none;

  bool get isSuccess => this == APIStatus.success;

  bool get isError => this == APIStatus.error;
}
