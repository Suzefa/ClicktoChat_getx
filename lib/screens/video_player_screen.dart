import 'package:click_to_chat/controllers/video_player_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'custom_screens/custom_scaffold.dart';

class VideoPlayerScreen extends GetView<VideoPlayerScreenController> {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: controller.videoPlayerScreenControllerKey,
      className: runtimeType.toString(),
      bodyWidget: _body(),
      screenName: 'Video Player',
      onBackButtonPress: () async {
        await controller.videoPlayerController.pause();
        Get.back();

      },
    );
  }

  Widget _body(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 50.0),
          child: Container(
            width: Get.width,
            height: Get.height-300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,width: 2)
            ),
            child: Material(
              elevation: 8.9,
              child: VideoPlayer(controller.videoPlayerController),
            ),
          ),
        ),
        _videoPlayPauseButton(),
      ],
    );
  }

  Widget _videoPlayPauseButton() {
    RxBool isElevated = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,),
      child: Obx(
            () =>
            GestureDetector(
              onTap: () async {
                isElevated.value = false;
                Future.delayed(const Duration(milliseconds: 200), () {
                  isElevated.value = true;
                });
                if(controller.videoPlayerController.value.isPlaying){
                  await controller.videoPlayerController.pause();
                }else if(!controller.videoPlayerController.value.isPlaying){
                  await controller.videoPlayerController.play();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: isElevated.value
                      ? [
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                        color: Colors.grey[500]!,
                        offset: const Offset(4, 4),
                        blurRadius: 10,
                        spreadRadius: 1),
                  ]
                      : null,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Icon(controller.videoPlayerController.value.isPlaying ? Icons.pause : !controller.videoPlayerController.value.isPlaying ? Icons.play_arrow : null,size: 50,),
                ),
              ),
            ),
      ),
    );
  }
}
