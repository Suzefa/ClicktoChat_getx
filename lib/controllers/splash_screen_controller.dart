import 'dart:async';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  RxInt seconds=5.obs;

  void increaseSeconds(){
    Timer.periodic(const Duration(seconds: 1), (timer){
      if(seconds.value == 0){
        timer.cancel();
        Get.offAndToNamed(kHomeScreenRoute);
      }else{
        seconds--;
      }
    });
  }
  @override
  void onInit() {
    increaseSeconds();
    super.onInit();
  }

  void onScreenTap(){
    seconds.value=0;
  }


}