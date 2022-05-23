import 'package:click_to_chat/utils/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonCode {
  CommonCode._internalConstructor();

  static final CommonCode _commonCode = CommonCode._internalConstructor();
  static const platform = MethodChannel('com.c2c.click_to_chat_getx');

  factory CommonCode() {
    return _commonCode;
  }

  Future<bool> onBackButtonPressed() async {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Exit App',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Do You Want Exit',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Card(
                      color: Colors.red,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => SystemNavigator.pop(),
                    child: Card(
                      color: Colors.green,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
    return false;
  }

  InputDecoration textFieldDecoration = InputDecoration(
    constraints: const BoxConstraints(minHeight: 50),
    // isDense: true,
    fillColor: Colors.green.shade100,
    filled: true,
    counterText: '',
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.blueGrey)),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black26)),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );

  void drawerHomePageButton(String screenName) {
    if (screenName == kHomeScreenRoute.split('/').last) {
      Get.back();
    } else {
      Get.back();
      Get.offAndToNamed(kHomeScreenRoute);
    }
  }

  void drawerStatusPageButton(String screenName) {
    if (screenName == kStatusScreenRoute.split('/').last) {
      Get.back();
    } else {
      Get.back();
      Get.offAndToNamed(kStatusScreenRoute);
    }
  }

  Widget customTextWidget({String? text, double? textSize,Color? textColor}) {
    return Text(
      text ?? '',
      style: TextStyle(
          color: textColor ?? Colors.black, fontWeight: FontWeight.bold, fontSize: textSize),
    );
  }

  Future<void> checkAndroidVersion()async{
    int version = 0;
    try {
      version = int.parse(
          await platform.invokeMethod('getBatteryLevel') ?? "0");
    } catch (e) {
      print('----------------------> ${e.toString()}');
    }
    print(' --------------------> android Version $version');
  }

}
