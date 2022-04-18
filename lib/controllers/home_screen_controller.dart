import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController extends GetxController {
  FocusNode phoneFieldFocusNode = FocusNode();
  late TextEditingController phoneNumberTextEditingController;

  RxString fieldErrorMessage=''.obs,countryCode='+92'.obs;

  @override
  void onInit() {
    phoneNumberTextEditingController = TextEditingController();
    super.onInit();
  }

  bool checkField(){
    if(phoneNumberTextEditingController.text == ''){
      fieldErrorMessage.value='Field Text Is Required';
    }else if(phoneNumberTextEditingController.text.length<10) {
      fieldErrorMessage.value="Phone number is Incomplete";
    } else {
      fieldErrorMessage.value='';
    }
    return fieldErrorMessage.isEmpty;
  }
  void onOpenChatButtonPressed(){
    if(checkField()){
      print('{{{{{{{{{{${countryCode.value}}}}${phoneNumberTextEditingController.text}}}}}}}}');
      if(phoneNumberTextEditingController.text.indexOf('0')==0){
        print("0 is the First Letter ${phoneNumberTextEditingController.text.substring(1)}");
      }else{

      }
    }else{
      print("::::::::::: ERROR :::::::::::::");
    }
  }

  void launchWhatsapp(String number) async {
    String url = 'https://wa.me/$number';

    await launch(url)
        ? await canLaunch(url)
        : Get.snackbar('Profile Error', 'Profile Not Found');
  }

  void checkFocus() {
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
