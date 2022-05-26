
import 'package:get/get.dart';
import 'package:intro_ticket/pages/home/home_page.dart';
import 'package:intro_ticket/pages/splash/splash_screen.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";

  static String getInitial() => '$initial';
  static String getSplashPage() => '$splashPage';

  static List<GetPage>  routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),

  ];
}

