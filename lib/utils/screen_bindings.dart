import 'package:click_to_chat/controllers/home_screen_controller.dart';
import 'package:click_to_chat/controllers/image_viewer_screen_controller.dart';
import 'package:click_to_chat/controllers/splash_screen_controller.dart';
import 'package:click_to_chat/controllers/status_screen_controller.dart';
import 'package:click_to_chat/controllers/video_player_screen_controller.dart';
import 'package:get/get.dart';

class ScreenBindings implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
    Get.lazyPut<StatusScreenController>(() => StatusScreenController());
    Get.lazyPut<ImageViewerScreenController>(() => ImageViewerScreenController());
    Get.lazyPut<VideoPlayerScreenController>(() => VideoPlayerScreenController());
  }

}