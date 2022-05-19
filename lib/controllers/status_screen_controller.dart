import 'dart:io';

import 'package:click_to_chat/utils/application_constants.dart';
import 'package:get/get.dart';

class StatusScreenController extends GetxController {
  RxList<String> filesInDirectoryList = RxList<String>();
  final statusDirectory =
      Directory(kInternalStorageBaseLocation + kLocalNewWAMediaStorage);

  void fetchDataFromDirectory() {
    filesInDirectoryList.value = statusDirectory
        .listSync()
        .map((filesItem) => filesItem.path)
        .where((element) => element.endsWith('.jpg'))
        .toList(growable: false);
  }

/*RxList<FileSystemEntity> dataInFolder=RxList<FileSystemEntity>();

  void getDataFromDirectory(Directory directory){
    directory.list().forEach((element) {

    });
  }*/

}
