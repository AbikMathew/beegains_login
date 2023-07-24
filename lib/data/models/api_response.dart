import 'dart:convert';

class ApiResponse {
  ApiResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Map data;

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
        success: map['success'] as bool,
        message: map['message'] as String,
        data: Map.from(
          (map['data'] as Map<String?, dynamic>),
        ));
  }

  factory ApiResponse.fromJson(dynamic source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
