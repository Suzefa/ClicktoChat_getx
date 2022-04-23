import 'dart:io';

import 'package:get/get.dart';

class StatusScreenController extends GetxController{

  RxList<FileSystemEntity> dataInFolder=RxList<FileSystemEntity>();

  void getDataFromDirectory(Directory directory){
    directory.list().forEach((element) {

    });
  }

}