import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/utils/common_texts.dart';
import '../../../../core/utils/enums.dart';
import '../../../models/api_response.dart';
import '../../../models/login_credentials.dart';

// A data source class responsible for making API calls related to user login
class LoginRemoteDataSource {
  final _dio = Dio();
  final _storage = FlutterSecureStorage();

  // Function to perform user login using provided credentials
  Future<AuthState> userLogin(LoginCredentials loginCredentials) async {
    // Prepare the form data for the API request
    final formData = FormData.fromMap({
      "username": loginCredentials.username,
      "password": loginCredentials.password,
    });

    try {
      // Send the login request to the server using Dio library
      final response = await _dio.post<Map<String, dynamic>>(
        baseURL + loginEndpoint,
        data: formData,
      );

      // Parse the API response using the ApiResponse model
      final apiResponse =
          ApiResponse.fromMap(response.data as Map<String, dynamic>);

      // Check if the login was successful based on the response
      if (apiResponse.success) {
        // If successful, retrieve the authentication token from the response
        final token = apiResponse.data['token'];

        // Clear any existing token and store the new token securely
        _storage.delete(key: bearerTokenKey);
        _storage.write(key: bearerTokenKey, value: token);

        return AuthState.authenticated; // Return the authenticated state
      } else {
        return AuthState.unauthenticated; // Return the unauthenticated state
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      return AuthState.unauthenticated; // Return the unauthenticated state
    }
  }
}
