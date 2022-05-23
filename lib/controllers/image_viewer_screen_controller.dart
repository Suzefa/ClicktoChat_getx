import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImageViewerScreenController extends GetxController{
  final GlobalKey<ScaffoldState> imageScreenKey = GlobalKey<ScaffoldState>();
  final String imageAddressArgument = Get.arguments ?? '';

}