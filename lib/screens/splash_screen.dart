import 'package:click_to_chat/controllers/splash_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onScreenTap: controller.onScreenTap,
      bodyWidget: _body(),
      scaffoldKey: controller.splashScreenKey,
      className: runtimeType.toString(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
                image: const DecorationImage(
                  image: AssetImage(kLogoAddress),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
                boxShadow: controller.isLoadingElevated.value
                    ? [
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                            color: Colors.grey[500]!,
                            offset: const Offset(4, 4),
                            blurRadius: 10,
                            spreadRadius: 1),
                      ]
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: CommonCode()
                    .customTextWidget(text: 'Loading..', textSize: 20.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
