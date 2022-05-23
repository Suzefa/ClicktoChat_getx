import 'dart:io';

import 'package:click_to_chat/controllers/status_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StatusScreen extends GetView<StatusScreenController> {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800),
        () => controller.fetchDataFromDirectory());
    return CustomScaffold(
      onBackButtonPress: CommonCode().onBackButtonPressed,
      bodyWidget: _body(),
      scaffoldKey: controller.statusScreenKey,
      className: runtimeType.toString(),
      screenName: 'Status Page',
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: controller.filesInDirectoryList.isEmpty,
                child: CommonCode().customTextWidget(
                    text: (controller.statusDirectoryOld.existsSync() ||
                            controller.statusDirectoryNew.existsSync())
                        ? controller.isLoaded.value == false
                            ? 'Loading Please wait'
                            : 'Watched Friends\'s Status Showed Up Here'
                        : 'Please Install Whatsapp First.'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: [
                    _customButton(buttonName: 'Photos', onPressed: () {}),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child:
                          _customButton(buttonName: 'Videos', onPressed: () {}),
                    ),
                  ],
                ),
              ),
              controller.isPhotoButtonPressed.isTrue
                  ? Wrap(
                      children: [
                        for (String path in controller.filesInDirectoryList)
                          if (path.contains('.jpg'))
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        File(path),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      ],
                    )
                  : Wrap(
                      children: [
                        for (String path in controller.filesInDirectoryList)
                          if (path.contains('.mp4'))
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Colors.black
                                  ),
                                  child: const Icon(Icons.play_arrow,color: Colors.white,),
                                ),
                              ),
                            ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customButton(
      {required String buttonName, required Function onPressed}) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (buttonName == 'Photos') {
            if (controller.isVideoButtonPressed.isTrue) {
              controller.isVideoButtonPressed.toggle();
            }
            controller.isPhotoButtonPressed.value = true;
            onPressed();
          } else {
            if (controller.isPhotoButtonPressed.isTrue) {
              controller.isPhotoButtonPressed.toggle();
            }
            controller.isVideoButtonPressed.value = true;
            onPressed();
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
            boxShadow: buttonName == 'Photos'
                ? controller.isPhotoButtonPressed.isFalse
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
                    : null
                : controller.isVideoButtonPressed.isFalse
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

}
