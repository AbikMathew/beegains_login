import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/data_source/remote_data_source/enquiry_list_screen/equiry_list_remote_data_source.dart';
import '../../data/models/enquiry_item.dart';

class EnquiryListNotifier extends AsyncNotifier<List<Enquiry>?> {
  Future<List<Enquiry>?> fetchEnquiryList() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final enquireListRemoteDataSource = EnquiryListRemoteDataSource();
      final enquiryResponse = await enquireListRemoteDataSource.getEnquiries();
      if (enquiryResponse == null) {
        throw Exception('Failed to fetch enquiry list');
      }

      return enquiryResponse.data.enquiries.enquiry;
    });
    return state.value ?? [];
  }

  @override
  Future<List<Enquiry>?> build() async {
    return await fetchEnquiryList();
  }
}

final enquiryListProvider =
    AsyncNotifierProvider<EnquiryListNotifier, List<Enquiry>?>(() {
  return EnquiryListNotifier();
});
