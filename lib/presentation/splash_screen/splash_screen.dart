import 'package:beegains_login_test/core/utils/enums.dart';
import 'package:beegains_login_test/presentation/login_screen/login_controller.dart';
import 'package:beegains_login_test/presentation/login_screen/login_screen.dart';
import 'package:beegains_login_test/presentation/enquiry_list_screen/enquiry_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen();
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
