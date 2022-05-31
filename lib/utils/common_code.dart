import 'dart:io';
import 'dart:typed_data';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CommonCode {
  CommonCode._internalConstructor();

  static final CommonCode _commonCode = CommonCode._internalConstructor();

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

  Widget imageView({required String imagePath}){
    return GestureDetector(
      onTap: (){
        Get.toNamed(kImageViewerScreenRoute,arguments: imagePath);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border:
              Border.all(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(
                  File(imagePath),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget videoThumbnailsViewer({required String videoPath}) {
    // Rx<Uint8List> imageThumbnailPath = Uint8List(2905).obs;
    // VideoThumbnail.thumbnailData(
    //   video: videoPath,
    //   imageFormat: ImageFormat.JPEG,
    //   // maxWidth: 128,
    //   // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
    //   // quality: 25,
    // ).then((value) => {imageThumbnailPath.value = value!});
    return GestureDetector(
      onTap: (){
        Get.toNamed(kVideoPlayerScreenRoute,arguments: videoPath);
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
              image: DecorationImage(
                image: FileImage(File(kAppMediaDirectoryPath+'/appLogo.png'),),
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
