class CustomException implements Exception {
  final String message;
  final bool? deviceRegistered;

  const CustomException(this.message, {this.deviceRegistered});
}
