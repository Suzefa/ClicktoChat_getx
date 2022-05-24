import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenController extends GetxController{
  final GlobalKey<ScaffoldState> videoPlayerScreenControllerKey = GlobalKey<ScaffoldState>();
  late VideoPlayerController videoPlayerController;
  final String videoPath = Get.arguments ?? '';

  @override
  void onInit() {
    videoPlayerController = VideoPlayerController.file(File(videoPath));
    videoPlayerController.initialize();
    super.onInit();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}