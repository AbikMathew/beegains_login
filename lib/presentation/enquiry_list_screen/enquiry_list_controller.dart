import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/remote_data_source/enquiry_list_screen/equiry_list_remote_data_source.dart';
import '../../data/models/enquiry_item.dart';

// Define a class to manage the state of the enquiry list with Riverpod
class EnquiryListNotifier extends AsyncNotifier<List<Enquiry>?> {
  // Function to fetch the list of enquiries from the remote data source
  Future<List<Enquiry>?> fetchEnquiryList() async {
    state = const AsyncValue.loading();

    // Use AsyncValue.guard to handle errors and loading state automatically
    state = await AsyncValue.guard(() async {
      final enquireListRemoteDataSource = EnquiryListRemoteDataSource();
      final enquiryResponse = await enquireListRemoteDataSource.getEnquiries();

      // If the response is null, throw an exception to indicate failure
      if (enquiryResponse == null) {
        throw Exception('Failed to fetch enquiry list');
      }

      // Return the list of enquiries from the response
      return enquiryResponse.data.enquiries.enquiry;
    });

    // Return the current state value or an empty list if the value is null
    return state.value ?? [];
  }

  @override
  // Build function is called when the provider is initialized
  Future<List<Enquiry>?> build() async {
    return await fetchEnquiryList();
  }
}

// Create a Riverpod provider to manage the enquiry list state
final enquiryListProvider =
    AsyncNotifierProvider<EnquiryListNotifier, List<Enquiry>?>(() {
  return EnquiryListNotifier();
});
