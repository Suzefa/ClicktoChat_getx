import 'dart:async';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final GlobalKey<ScaffoldState> splashScreenKey = GlobalKey<ScaffoldState>();

  RxInt seconds = 5.obs;
  RxBool isLoadingElevated = true.obs;

  void increaseSeconds() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      isLoadingElevated.toggle();
      if (seconds.value == 0) {
        timer.cancel();
        Get.offAndToNamed(kHomeScreenRoute);
      } else {
        seconds--;
      }
    });
  }

  @override
  void onInit() {
    increaseSeconds();
    super.onInit();
  }

  void onScreenTap() {
    CommonCode().checkAndroidVersion();
    seconds.value = 0;
  }
}
