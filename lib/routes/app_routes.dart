import 'package:flutter/material.dart';
import 'package:beegains_login_test/presentation/splash_screen/splash_screen.dart';
import 'package:beegains_login_test/presentation/login_screen/login_screen.dart';
import 'package:beegains_login_test/presentation/order_screen/enquiry_list_screen.dart';
import 'package:beegains_login_test/presentation/order_details_screen/order_details_screen.dart';
import 'package:beegains_login_test/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String searchScreen = '/search_screen';

  static const String searchResultScreen = '/search_result_screen';

  static const String listCategoryScreen = '/list_category_screen';

  static const String sortByScreen = '/sort_by_screen';

  static const String filterScreen = '/filter_screen';

  static const String orderScreen = '/order_screen';

  static const String orderDetailsScreen = '/order_details_screen';

  static const String addressScreen = '/address_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreen: (context) => LoginScreen(),
    orderScreen: (context) => EnquiryListScreen(),
    orderDetailsScreen: (context) => OrderDetailsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
