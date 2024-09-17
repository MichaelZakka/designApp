class ApiErrorResponse<T> {
  final String status;
  final T message;

  ApiErrorResponse({
    required this.status,
    required this.message});

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      status: json["status"],
      message: json["message"],
    );
  }
}
