import 'package:click_to_chat/utils/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: controller.onScreenTap,
        child: Center(
          child: Container(
            width: Get.width,
            height: Get.height,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Image.asset(kLogoTransparentAddress,height: 400,width: 400,),
          ),
        ),
      ),
    );
  }
}
