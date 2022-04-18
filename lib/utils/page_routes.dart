
import 'package:click_to_chat/screens/home_screen.dart';
import 'package:click_to_chat/screens/splash_screen.dart';
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/screen_bindings.dart';
import 'package:get/get.dart';

class PageRoutes{

  static List<GetPage> routeGenerator=<GetPage>[
    GetPage(name: kSplashScreenRoute, page:()=>const SplashScreen(),binding: ScreenBindings()),
    GetPage(name: kHomeScreenRoute, page:()=>const HomeScreen(),binding: ScreenBindings()),
  ];
}