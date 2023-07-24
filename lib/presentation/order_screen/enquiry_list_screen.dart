import 'package:beegains_login_test/presentation/controllers/enquiry_list_controller/enquiry_list_controller.dart';
import 'package:beegains_login_test/presentation/order_screen/widgets/enquiry_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:beegains_login_test/core/app_export.dart';
import 'package:beegains_login_test/widgets/app_bar/appbar_image.dart';
import 'package:beegains_login_test/widgets/app_bar/appbar_title.dart';
import 'package:beegains_login_test/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class EnquiryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
            height: getVerticalSize(56),
            leadingWidth: 40,
            leading: AppbarImage(
                height: getSize(24),
                width: getSize(24),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 15, bottom: 16),
                onTap: () {
                  onTapArrowleft2(context);
                }),
            title: AppbarTitle(text: "Enquiries", margin: getMargin(left: 12))),
        body: Consumer(builder: (context, ref, child) {
          final enquiryList = ref.watch(enquiryListProvider);
          return enquiryList.when(
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
          );
        }),
      ),
    );
  }

  onTapOrder(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.orderDetailsScreen);
  }

  onTapArrowleft2(BuildContext context) {
    Navigator.pop(context);
  }
}
