import 'dart:async';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  RxInt seconds=0.obs;

  void increaseSeconds(){
    Timer.periodic(const Duration(seconds: 1), (timer){
      if(seconds.value == 10){
        timer.cancel();
        Get.offAndToNamed(kHomeScreenRoute);
      }else{
        seconds++;
      }
    });
  }
  @override
  void onReady() {
    increaseSeconds();
    super.onReady();
  }

  void onScreenTap(){
    if(seconds.value != 10){
      seconds.value=10;
    }
  }


}