import 'dart:developer';

import 'package:beegains_login_test/core/utils/common_texts.dart';
import 'package:beegains_login_test/core/utils/enums.dart';
import 'package:beegains_login_test/data/models/api_response.dart';
import 'package:beegains_login_test/data/models/login_credentials.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRemoteDataSource {
  final _dio = Dio();
  final _storage = FlutterSecureStorage();

  Future<AuthState> userLogin(LoginCredentials loginCredentials) async {
    final formData = FormData.fromMap({
      "username": loginCredentials.username,
      "password": loginCredentials.password,
    });

    try {
      final response = await _dio.post<Map<String, dynamic>>(
        baseURL + loginEndpoint,
        data: formData,
      );
      final apiResponse =
          ApiResponse.fromMap(response.data as Map<String, dynamic>);

      if (apiResponse.success) {
        final token = apiResponse.data['token'];
        _storage.delete(key: bearerTokenKey);
        _storage.write(key: bearerTokenKey, value: token);

        return AuthState.authenticated;
      } else {
        return AuthState.unauthenticated;
      }
    } catch (e) {
      log('Api call has been failed');
      return AuthState.unauthenticated;
    }
  }
}
