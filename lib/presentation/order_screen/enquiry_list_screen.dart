import 'package:beegains_login_test/presentation/login_screen/login_controller.dart';
import 'package:beegains_login_test/presentation/order_screen/enquiry_list_controller.dart';
import 'package:beegains_login_test/presentation/order_screen/widgets/enquiry_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:beegains_login_test/core/app_export.dart';
import 'package:beegains_login_test/widgets/app_bar/appbar_title.dart';
import 'package:beegains_login_test/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EnquiryListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => EnquiryItemWidget(
                    enquiry: data[index],
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
