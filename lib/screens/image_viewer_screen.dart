import 'package:click_to_chat/controllers/image_viewer_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewerScreen extends GetView<ImageViewerScreenController> {
  const ImageViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bodyWidget: _body(),
      scaffoldKey: controller.imageScreenKey,
      className: runtimeType.toString(),
      onBackButtonPress: () => Get.back(),
    );
  }

  Widget _body() {
    return Container();
  }
}
