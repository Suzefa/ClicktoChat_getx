import 'dart:io';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusScreenController extends GetxController {
  final GlobalKey<ScaffoldState> statusScreenKey = GlobalKey<ScaffoldState>();

  RxList<String> filesInDirectoryList = RxList<String>();
  final statusDirectory =
      Directory(kInternalStorageBaseLocation + kLocalOldWAMediaStorage);

  void fetchDataFromDirectory() async{
    // filesInDirectoryList.value = statusDirectory.listSync().map((FileSystemEntity fileSystemEntity) => fileSystemEntity).where((element) => element.path.isNotEmpty).toList(growable: false);
    // print('=>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ${filesInDirectoryList.length}');
    // for (FileSystemEntity element in filesInDirectoryList) {
    //   print('====================================> File in status directory $element');
    // }

    final imageList = statusDirectory
        .listSync()
        .map((item) => item.path).toList(growable: false);
    print("imageList======================> $imageList");
    print("--------**********************> ${statusDirectory.listSync().first.statSync().type}");
  }

  @override
  void onInit() {
    fetchDataFromDirectory();
    super.onInit();
  }

/*RxList<FileSystemEntity> dataInFolder=RxList<FileSystemEntity>();

  void getDataFromDirectory(Directory directory){
    directory.list().forEach((element) {

    });
  }*/

}
