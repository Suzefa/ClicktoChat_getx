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
        _animatedOpacityWidget(
          child: Material(
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
          forwardOpacityEnable: true,
        ),
        _animatedOpacityWidget(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity:
                      controller.isLoadingElevated.value == true ? 0.0 : 1.0,
                  child: CommonCode()
                      .customTextWidget(text: 'Click to Chat', textSize: 20.0),
                ),
              ),
            ),
            forwardOpacityEnable: true),
        Obx(
          () => controller.isPermissionWidgetVisible.value
              ? _animatedOpacityWidget(
                  child: _permissionWidget(), forwardOpacityEnable: false)
              : Container(),
        ),
      ],
    );
  }

  Widget _permissionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(50.0),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          kLogoAddress,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CommonCode().customTextWidget(
                    text: "PERMISSIONS REQUIRED",
                    textSize: 20.0,
                    textColor: Colors.blue),
              ),
              _customPermissionWidget(
                  buttonTitle: 'Camera Permission:',
                  onPressed: controller.onCameraPermission),
              _customPermissionWidget(
                  buttonTitle: 'Storage Permission:', onPressed: controller.onStoragePermission),
              Visibility(
                visible: controller.statusDirectoryNew.existsSync(),
                child: _customPermissionWidget(
                    buttonTitle: 'Scoped Storage Permission:',
                    onPressed: controller.onExternalStoragePermission),
              ),
              Visibility(
                visible:
                controller.cameraPermission.isTrue & controller.storagePermission.isTrue & controller.externalStoragePermission.isTrue,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: _customButton(buttonName: 'Done', onPressed: controller.onDonePermissionButton),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CommonCode()
                    .customTextWidget(text: 'What are Permissions?'),
              ),
              CommonCode()
                  .customTextWidget(text: 'For Information Tap on Read More'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _customButton(buttonName: 'Read More', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customPermissionWidget(
      {required String buttonTitle, required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
      child: Row(
        children: [
          CommonCode().customTextWidget(
              text: buttonTitle, textSize: 18.0, textColor: Colors.green),
          const Spacer(),
          if (buttonTitle == 'Camera Permission:')
            Obx(
              () => controller.cameraPermission.value == true
                  ? CommonCode().customTextWidget(text: 'Enabled')
                  : _customButton(buttonName: 'Enable', onPressed: onPressed),
            ),
          if (buttonTitle == 'Storage Permission:')
            Obx(
              () => controller.storagePermission.value == true
                  ? CommonCode().customTextWidget(text: 'Enabled')
                  : _customButton(buttonName: 'Enable', onPressed: onPressed),
            ),
          if (buttonTitle == 'Scoped Storage Permission:')
            Obx(
              () => controller.externalStoragePermission.value == true
                  ? CommonCode().customTextWidget(text: 'Enabled')
                  : _customButton(buttonName: 'Enable', onPressed: onPressed),
            ),
        ],
      ),
    );
  }

  Widget _customButton(
      {required String buttonName, required Function onPressed}) {
    RxBool isElevated = true.obs;
    return Obx(
      () => GestureDetector(
        onTap: () {
          isElevated.value = false;
          Future.delayed(const Duration(milliseconds: 200), () {
            isElevated.value = true;
          });
          onPressed();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            boxShadow: isElevated.value
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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              buttonName,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _animatedOpacityWidget({
    required Widget child,
    required bool forwardOpacityEnable,
  }) {
    RxBool isVisible = true.obs;
    RxBool opacityCondition = true.obs;
    Future.delayed(Duration(milliseconds: forwardOpacityEnable ? 1000 : 100),
        () {
      opacityCondition.toggle();
    });
    if (forwardOpacityEnable) {
      Future.delayed(const Duration(seconds: 2), () {
        isVisible.toggle();
      });
    }
    return Obx(
      () => Visibility(
        visible: isVisible.value,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          opacity: forwardOpacityEnable
              ? opacityCondition.isTrue
                  ? 1.0
                  : 0.0
              : opacityCondition.isTrue
                  ? 0.0
                  : 1.0,
          child: child,
        ),
      ),
    );
  }
}
