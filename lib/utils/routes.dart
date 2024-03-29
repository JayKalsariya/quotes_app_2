import 'package:quotes_app_2/headers.dart';

class MyRoutes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
  };
}
