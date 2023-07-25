import 'package:flutter/material.dart';
import 'package:beegains_login_test/presentation/splash_screen/splash_screen.dart';
import 'package:beegains_login_test/presentation/login_screen/login_screen.dart';
import 'package:beegains_login_test/presentation/enquiry_list_screen/enquiry_list_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String enquireListScreen = '/enquiry_list_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    enquireListScreen: (context) => EnquiryListScreen(),
  };
}
