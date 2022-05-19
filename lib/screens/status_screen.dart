import 'package:click_to_chat/controllers/status_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusScreen extends GetView<StatusScreenController> {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onBackButtonPress: CommonCode().onBackButtonPressed,
      bodyWidget: _body(),
      scaffoldKey: controller.statusScreenKey,
      className: runtimeType.toString(),
    );
  }

  Widget _body() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      // child: _scrollableList(),
    );
  }

  Widget _scrollableList() {
    return Obx(
      () => controller.statusDirectory.existsSync()
          ? ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                for (String path in controller.filesInDirectoryList) Text(path),
              ],
            )
          : const Text('Please Install Whatsapp First'),
    );
  }
}
