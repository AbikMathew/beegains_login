import 'package:beegains_login_test/core/utils/enums.dart';
import 'package:beegains_login_test/presentation/login_screen/login_controller.dart';
import 'package:beegains_login_test/presentation/login_screen/login_screen.dart';
import 'package:beegains_login_test/presentation/order_screen/enquiry_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authenticationProvider);

    return authProvider.when(
      data: (authState) {
        return authState == AuthState.authenticated
            ? EnquiryListScreen()
            : LoginScreen();
      },
      error: (error, stackTrace) => Center(
        child: Text(error.toString()),
      ),
      loading: () => Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

 // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: ColorConstant.lightBlueA200,
    //     body: Container(
    //       width: double.maxFinite,
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CustomImageView(
    //             imagePath: ImageConstant.imgLogo,
    //             height: getSize(
    //               72,
    //             ),
    //             width: getSize(
    //               72,
    //             ),
    //             margin: getMargin(
    //               bottom: 5,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
