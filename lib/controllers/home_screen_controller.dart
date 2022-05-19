import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  final GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  FocusNode phoneFieldFocusNode = FocusNode();
  late TextEditingController phoneNumberTextEditingController;

  RxString fieldErrorMessage = ''.obs, countryCode = '+92'.obs;
  RxInt textFieldLength = 11.obs;
  RxList<String> historyList = RxList<String>();

  @override
  void onInit() {
    phoneNumberTextEditingController = TextEditingController();
    super.onInit();
  }

  bool checkField() {
    textFieldLength.value =
        phoneNumberTextEditingController.text.indexOf('0') == 0 ? 11 : 10;
    fieldErrorMessage.value = phoneNumberTextEditingController.text == ""
        ? "Phone Number Is Required"
        : phoneNumberTextEditingController.text.length <
                (phoneNumberTextEditingController.text.indexOf('0') == 0
                    ? 11
                    : 10)
            ? "Phone number is Incomplete"
            : "";
    return fieldErrorMessage.isEmpty;
  }

  void onOpenChatButtonPressed() {
    if (checkField()) {
      if (countryCode.value == '+92') {
        launchWhatsapp(
            '$countryCode${phoneNumberTextEditingController.text.indexOf('0') == 0 ? phoneNumberTextEditingController.text.substring(1) : phoneNumberTextEditingController.text}');
      } else {
        launchWhatsapp(countryCode + phoneNumberTextEditingController.text);
      }
    }
  }

  void launchWhatsapp(String number) async {
    String url = 'https://wa.me/$number';

    bool bol = false;
    bol = await launch(url);
    if (!bol) {
      bol = await canLaunch(url);
    }
    print('===================> $bol');
  }

  void removeFocus() {
    if (phoneFieldFocusNode.hasFocus) {
      phoneFieldFocusNode.unfocus();
    }
  }

  @override
  void dispose() {
    phoneNumberTextEditingController.dispose();
    super.dispose();
  }
}
