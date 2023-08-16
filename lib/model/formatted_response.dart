class FormattedResponse {
  final bool success;
  final bool? deviceRegistered;
  final dynamic data;
  final String? responseCodeError;
  final int? statusCode;

  FormattedResponse({
    required this.success,
    this.deviceRegistered,
    this.data,
    this.responseCodeError,
    this.statusCode,
  });
}
