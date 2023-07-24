import 'dart:developer';

import 'package:beegains_login_test/core/utils/common_texts.dart';
import 'package:beegains_login_test/data/models/enquiry_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EnquiryListRemoteDataSource {
  final storage = new FlutterSecureStorage();
  final dio = Dio();

  Future<EnquiryListResponse?> getEnquiries() async {
    // Retrieve the token from secure storage
    String? token = await storage.read(key: bearerTokenKey);

    // Set the authorization header with the bearer token
    dio.options.headers['Authorization'] = 'Bearer $token';

    final queryParams = {
      'page': 1,
      'franchise_id': 2,
      'search': '',
      'from_date': '',
      'to_date': '',
      'est_status': '',
      'jobcards': 0,
    };

    // Make the GET request
    final response = await dio.get<Map<String, dynamic>>(
      baseURL + enquiryListEndpoint,
      queryParameters: queryParams,
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Success
      final data = response.data;
      log(data!.entries.toString());
      return EnquiryListResponse.fromMap(data);
    } else {
      // Error
      // ...
    }
    return null;
  }
}
