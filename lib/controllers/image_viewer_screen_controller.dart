import 'dart:io';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImageViewerScreenController extends GetxController{
  final GlobalKey<ScaffoldState> imageScreenKey = GlobalKey<ScaffoldState>();
  final String imageAddressArgument = Get.arguments ?? '';

  void saveImageToFolder() async {
    if(kAppPhotosDataDirectory.existsSync()){
      if(!File(kStatusPhotoDirectoryPath+'/'+imageAddressArgument.split('/').last).existsSync()){
        await File(imageAddressArgument).copy(kStatusPhotoDirectoryPath+'/${imageAddressArgument.split('/').last}');
      }
    }
  }

}