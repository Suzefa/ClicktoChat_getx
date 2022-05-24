import 'dart:typed_data';

import 'package:click_to_chat/controllers/status_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
                    _customButton(
                      buttonName: 'Photos',
                      onPressed: () {
                        if (controller.isVideoButtonPressed.isTrue) {
                          controller.isVideoButtonPressed.toggle();
                        }
                        controller.isPhotoButtonPressed.value = true;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: _customButton(
                        buttonName: 'Videos',
                        onPressed: () {
                          if (controller.isPhotoButtonPressed.isTrue) {
                            controller.isPhotoButtonPressed.toggle();
                          }
                          controller.isVideoButtonPressed.value = true;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  for (String path in controller.filesInDirectoryList)
                    path.contains('.jpg')
                        ? Visibility(
                            visible: controller.isPhotoButtonPressed.value,
                            child: CommonCode().imageView(imagePath: path),
                          )
                        : path.contains('mp4')
                            ? Visibility(
                                visible: controller.isVideoButtonPressed.value,
                                child: CommonCode().videoThumbnailsViewer(videoPath: path),
                              )
                            : Visibility(
                                visible: false,
                                child: Container(),
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
          onPressed();
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

  Widget _videoThumbnailsViewer({required String videoPath}) {
    Rx<Uint8List> imageThumbnailPath = Uint8List(2905).obs;
    VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      // maxWidth: 128,
      // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
      // quality: 25,
    ).then((value) => {imageThumbnailPath.value = value!});
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(50.0),
        child: Obx(
          () => Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
              image: imageThumbnailPath.value.contains(-2905)
                  ? null
                  : DecorationImage(
                      image: MemoryImage(imageThumbnailPath.value),
                    ),
            ),
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
