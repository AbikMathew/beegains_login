import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/app_style.dart';

class EnquiryItemText2 extends StatelessWidget {
  const EnquiryItemText2({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      style: AppStyle.txtPoppinsRegular12Indigo90087.copyWith(
        letterSpacing: getHorizontalSize(
          0.5,
        ),
      ),
    );
  }
}
