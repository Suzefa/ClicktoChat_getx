
import 'package:click_to_chat/screens/home_screen.dart';
import 'package:click_to_chat/screens/image_viewer_screen.dart';
import 'package:click_to_chat/screens/splash_screen.dart';
import 'package:click_to_chat/screens/status_screen.dart';
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/screen_bindings.dart';
import 'package:get/get.dart';

class PageRoutes{

  static List<GetPage> routeGenerator=<GetPage>[
    GetPage(name: kSplashScreenRoute, page:()=>const SplashScreen(),binding: ScreenBindings(),transition: Transition.rightToLeft),
    GetPage(name: kHomeScreenRoute, page:()=>const HomeScreen(),binding: ScreenBindings(),transition: Transition.rightToLeft),
    GetPage(name: kStatusScreenRoute, page:()=>const StatusScreen(),binding: ScreenBindings(),transition: Transition.rightToLeft),
    GetPage(name: kImageViewerScreenRoute, page:()=>const ImageViewerScreen(),binding: ScreenBindings(),transition: Transition.rightToLeft),
  ];
}