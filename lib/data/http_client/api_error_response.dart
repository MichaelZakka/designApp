class ApiErrorResponse<T> {
  final String message;
  final T errors;

  ApiErrorResponse({
    required this.message,
    required this.errors});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      message: json["message"],
      errors: json["errors"],
    );
  }
}
