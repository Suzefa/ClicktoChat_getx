import 'dart:async';
import 'dart:io';

import 'package:click_to_chat/models/permissions_model.dart';
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/permission_handler.dart';
import 'package:click_to_chat/utils/permission_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController clickAnimatedOpacityController;
  final GlobalKey<ScaffoldState> splashScreenKey = GlobalKey<ScaffoldState>();
  final statusDirectoryNew =
      Directory(kInternalStorageBaseLocation + kLocalNewWAMediaStorage);
  final GetStorage _storage = GetStorage();

  RxInt seconds = 2.obs;
  RxBool isLoadingElevated = false.obs,
      isPermissionWidgetVisible = false.obs,
      cameraPermission = false.obs,
      storagePermission = false.obs,
      externalStoragePermission = false.obs;

  void increaseSeconds() async {
    Future.delayed(const Duration(seconds: 2), () {
      isLoadingElevated.toggle();
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
        if (PermissionSession.globalPermissions.value.isAllPermissionProvided !=
            -1) {
          Get.offAndToNamed(kHomeScreenRoute);
        } else {
          isPermissionWidgetVisible.toggle();
        }
      } else {
        seconds--;
      }
    });
  }

  void onDonePermissionButton() async {
    PermissionSession.globalPermissions.value.isAllPermissionProvided = 1;
    if(statusDirectoryNew.existsSync()) {
      PermissionSession.globalPermissions.value.isExternalStoragePermissionProvided = 1 ;
    }
    await _storage.write(kPermissionSessionStoreToken,
        PermissionSession.globalPermissions.value.toStringForSession());
    Get.offAndToNamed(kHomeScreenRoute);
  }

  void onCameraPermission() async {
    PermissionSession.globalPermissions.value.isCameraPermissionProvided =
        await PermissionHandler().askPermissionCamera();
    if(PermissionSession.globalPermissions.value.isCameraPermissionProvided==1){
      cameraPermission.value=true;
    }
  }

  void onStoragePermission() async {
    PermissionSession.globalPermissions.value.isStoragePermissionProvided =
    await PermissionHandler().askPermissionToManageStorage();
    if(PermissionSession.globalPermissions.value.isStoragePermissionProvided==1){
      storagePermission.value=true;
    }
  }

  void onExternalStoragePermission() async {
    PermissionSession.globalPermissions.value.isExternalStoragePermissionProvided =
    await PermissionHandler().askPermissionToManageExternalStorage();
    if(PermissionSession.globalPermissions.value.isExternalStoragePermissionProvided==1){
      externalStoragePermission.value=true;
    }
  }

  void sessionData() {
    PermissionSession
            .globalPermissions.value.isExternalStoragePermissionProvided =
        statusDirectoryNew.existsSync() ? -1 : 1;
    String? sessionValue = _storage.read(kPermissionSessionStoreToken);
    if (sessionValue != null) {
      PermissionSession.globalPermissions.value =
          PermissionsModel.fromString(stringModel: sessionValue);
    }
  }

  @override
  void onInit() {
    sessionData();
    increaseSeconds();
    clickAnimatedOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.onInit();
  }

  @override
  void dispose() {
    clickAnimatedOpacityController.dispose();
    super.dispose();
  }
}
