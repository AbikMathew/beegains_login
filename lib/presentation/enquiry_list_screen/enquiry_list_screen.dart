import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../login_screen/login_controller.dart';
import 'enquiry_list_controller.dart';
import 'widgets/enquiry_item_error_snackbar.dart';
import 'widgets/enquiry_item_widget.dart';

class EnquiryListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      enquiryListProvider,
      (previous, next) {},
      onError: (error, stackTrace) =>
          ScaffoldMessenger.of(context).showSnackBar(
        errorSnackbar(error, ref),
      ),
    );

    final enquiryList = ref.watch(enquiryListProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(56),
          title: AppbarTitle(
            text: "Enquiries",
            margin: getMargin(left: 15),
          ),
          actions: [
            TextButton(onPressed: () => signOut(ref), child: Text('Sign out'))
          ],
        ),
        body: enquiryList.when(
          data: (enquiries) => ListView.builder(
              itemCount: enquiries?.length,
              itemBuilder: (context, index) => EnquiryItemWidget(
                    enquiry: enquiries?[index],
                  )),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }

  void signOut(WidgetRef ref) {
    ref.read(authenticationProvider.notifier).logoutUser();
  }
}
