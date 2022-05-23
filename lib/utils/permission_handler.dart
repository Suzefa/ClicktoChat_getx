import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class PermissionHandler{
  PermissionHandler._internalPrivateConstructor();
  static final PermissionHandler _instance= PermissionHandler._internalPrivateConstructor();

  factory PermissionHandler(){
    return _instance;
  }

  Future<int> askPermissionToManageExternalStorage()async{
    int valueReturn= -1;
    PermissionStatus permissionStatus = await Permission.manageExternalStorage.request();
    if(permissionStatus.isGranted){
      valueReturn = 1;
    }else{
      await openAppSettings();
    }
    return valueReturn;
  }

  Future<int> askPermissionCamera()async{
    int valueReturn= -1;
    PermissionStatus permissionStatus = await Permission.camera.request();
    log('++++++++++++++++++++++++++++++++> $permissionStatus');
    if(permissionStatus.isGranted){
      valueReturn = 1;
    }else{
      await openAppSettings();
    }
    return valueReturn;
  }

  Future<int> askPermissionToManageStorage()async{
    int valueReturn= -1;
    PermissionStatus permissionStatus = await Permission.storage.request();
    if(permissionStatus.isGranted){
      valueReturn = 1;
    }else{
      await openAppSettings();
    }
    return valueReturn;
  }
}