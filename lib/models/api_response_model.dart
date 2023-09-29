abstract class ApiResponse<T>{
  int statusCode;
  String message;
  T data;

  ApiResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}