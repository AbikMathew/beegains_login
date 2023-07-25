import 'package:flutter/material.dart';

import 'package:beegains_login_test/core/app_export.dart';
import 'package:beegains_login_test/data/models/enquiry_item.dart';

import 'enquiry_item_text_2.dart';

class EnquiryItemWidget extends StatelessWidget {
  const EnquiryItemWidget({required this.enquiry, this.onTapEnquiry});

  final VoidCallback? onTapEnquiry;
  final Enquiry? enquiry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          onTapEnquiry?.call();
        },
        child: Container(
          padding: getPadding(
            top: 5,
            bottom: 5,
          ),
          decoration: AppDecoration.outlineBlue501.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                  ),
                  child: Text(
                    enquiry?.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold14Indigo900.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.5,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 16,
                    top: 3,
                  ),
                  child: EnquiryItemText2(text: enquiry?.enquiryDate ?? ''),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 22,
                ),
                child: Divider(
                  height: getVerticalSize(1),
                  thickness: getVerticalSize(1),
                  color: ColorConstant.blue50,
                ),
              ),
              Padding(
                padding: getPadding(left: 16, top: 14, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(bottom: 1),
                      child: EnquiryItemText2(text: 'Enquiry Number'),
                    ),
                    Padding(
                      padding: getPadding(top: 1),
                      child: Text(
                        enquiry?.enquiryNo ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Indigo900.copyWith(
                          letterSpacing: getHorizontalSize(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 16, top: 9, right: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: getPadding(bottom: 1),
                      child: EnquiryItemText2(text: 'Phone number'),
                    ),
                    Padding(
                      padding: getPadding(top: 1),
                      child: Text(
                        enquiry?.primaryMobile ?? '',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsRegular12Indigo900.copyWith(
                          letterSpacing: getHorizontalSize(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(left: 16, top: 9, right: 17, bottom: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EnquiryItemText2(text: 'RC Owner'),
                    Text(
                      enquiry?.rcOwnerName ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsBold12.copyWith(
                        letterSpacing: getHorizontalSize(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
