import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enquiry_list_controller.dart';

SnackBar errorSnackbar(Object error, WidgetRef ref) {
  return SnackBar(
    content: Text('Error: $error'),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () {
        // Retry the operation by calling the fetchEnquiryList method
        ref.read(enquiryListProvider.notifier).fetchEnquiryList();
      },
    ),
  );
}
