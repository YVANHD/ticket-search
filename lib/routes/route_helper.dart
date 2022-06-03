
import 'package:get/get.dart';
import 'package:intro_ticket/pages/home/home_page.dart';
import 'package:intro_ticket/pages/places/search_places.dart';
import 'package:intro_ticket/pages/reservation/reservation.dart';
import 'package:intro_ticket/pages/splash/splash_screen.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String reservation = "/result";
   static const String details = "/detail";
  static const String initial = "/";

  static String getInitial() => '$initial';
  static String getSplashPage() => '$splashPage';
  static String getResult() => '$reservation';
   static String getDetail() => '$details';

  static List<GetPage>  routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(name: reservation, page: () => ReservationTravelPages(), transition: Transition.circularReveal ),
     GetPage(name: details, page: () => const SearchPlaces(), transition: Transition.fadeIn ),

  ];
}

