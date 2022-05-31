import 'dart:io';

import 'package:click_to_chat/controllers/image_viewer_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewerScreen extends GetView<ImageViewerScreenController> {
  const ImageViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      screenName: 'Image Viewer',
      bodyWidget: _body(),
      scaffoldKey: controller.imageScreenKey,
      className: runtimeType.toString(),
      onBackButtonPress: () => Get.back(),
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 50.0),
          child: Container(
            height: Get.height-300,
            width: Get.width,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: Colors.black,width: 2),
              color: Colors.black
            ),
            child: Material(
              elevation: 8.7,
              child: Image.file(File(controller.imageAddressArgument),fit: BoxFit.contain,),
            ),
          ),
        ),
        _saveImageButton(),
      ],
    );
  }

  Widget _saveImageButton() {
    RxBool isElevated = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,),
      child: Obx(
            () =>
            GestureDetector(
              onTap: () {
                isElevated.value = false;
                Future.delayed(const Duration(milliseconds: 200), () {
                  isElevated.value = true;
                });
                controller.saveImageToFolder();
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
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
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.download_sharp,size: 50,),
                ),
              ),
            ),
      ),
    );
  }
}
