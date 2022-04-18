
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/page_routes.dart';
import 'package:click_to_chat/utils/screen_bindings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ScreenBindings(),
      initialRoute: kSplashScreenRoute,
      getPages: PageRoutes.routeGenerator,
    );
  }
}

