import 'dart:io';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusScreenController extends GetxController {
  final GlobalKey<ScaffoldState> statusScreenKey = GlobalKey<ScaffoldState>();

  RxList<String> filesInDirectoryList = RxList<String>();
  RxList<String> listOfThumbnails=RxList<String>();
  RxBool isLoaded= false.obs,isPhotoButtonPressed = false.obs,isVideoButtonPressed=false.obs;
  final statusDirectoryNew =
      Directory(kInternalStorageBaseLocation + kLocalNewWAMediaStorage);
  final statusDirectoryOld =
      Directory(kInternalStorageBaseLocation + kLocalOldWAMediaStorage);


  void fetchDataFromDirectory() {
    if(statusDirectoryOld.existsSync()){
      filesInDirectoryList.clear();
      filesInDirectoryList.value = statusDirectoryOld.listSync().map((FileSystemEntity file) => file.path).toList();
    }else if(statusDirectoryNew.existsSync()){
      filesInDirectoryList.clear();
      filesInDirectoryList.value = statusDirectoryNew.listSync().map((FileSystemEntity file) => file.path).toList();
    }
    isLoaded.value = true;
    isPhotoButtonPressed.value=true;
  }

  void saveThumbNailsForVideos(String videoUrl)async{
    if(File(kTempDataDirectoryPath+'/'+videoUrl.split('/').last).existsSync()){

    }
    // for(String videoUrl in filesInDirectoryList){
    //   if(videoUrl.contains('.mp4')){
    //
    //   }
    // }
  }

}
