import 'package:beegains_login_test/data/data_source/remote_data_source/enquiry_list_screen/equiry_list_remote_data_source.dart';
import 'package:beegains_login_test/data/models/enquiry_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final enquiryListProvider =
    AsyncNotifierProvider<AuthAsyncNotifier, List<Enquiry>>(() {
  return AuthAsyncNotifier();
});

class AuthAsyncNotifier extends AsyncNotifier<List<Enquiry>> {
  Future<List<Enquiry>> fetchEnquiryList() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final enquireListRemoteDataSource = EnquiryListRemoteDataSource();
      final enquiryResponse = await enquireListRemoteDataSource.getEnquiries();

      return enquiryResponse!.data.enquiries.enquiry;
    });
    return state.value ?? [];
  }

  @override
  Future<List<Enquiry>> build() async {
    return await fetchEnquiryList();
  }
}
