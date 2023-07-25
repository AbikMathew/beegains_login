import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/utils/common_texts.dart';
import '../../../models/enquiry_item.dart';

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
      return EnquiryListResponse.fromMap(data!);
    } else {
      // Null data exception is thrown in controller
      return null;
    }
  }
}
