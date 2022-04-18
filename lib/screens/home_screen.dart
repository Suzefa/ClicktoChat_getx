import 'package:click_to_chat/controllers/home_screen_controller.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/application_constants.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Open Chats Faster',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.mobile_friendly,
                color: Colors.black,
              ),
            ],
          ),
          backgroundColor: Colors.green.shade100,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: controller.checkFocus,
          child: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(kBackgroundImageAddress),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.1), BlendMode.darken)),
                ),
              ),
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: Colors.green.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Expanded(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Center(
                                child: Text(
                                  'Open Chats Without Saving Number',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Obx(
                                () => Visibility(
                                  visible:
                                      controller.fieldErrorMessage.isNotEmpty,
                                  child: Text(
                                    controller.fieldErrorMessage.value,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 5.0),
                                height: 60,
                                width: Get.width,
                                child: Obx(
                                  () => TextField(
                                    onChanged: (textValue) {
                                      controller.checkField();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    maxLength: controller.textFieldLength.value,
                                    controller: controller
                                        .phoneNumberTextEditingController,
                                    focusNode: controller.phoneFieldFocusNode,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                      prefixIcon: CountryCodePicker(
                                        showFlag: true,
                                        initialSelection: 'PK',
                                        favorite: const ['+92', 'PK'],
                                        onChanged: (country) {
                                          controller.countryCode.value =
                                              '${country.dialCode}';
                                        },
                                      ),
                                      counterText: '',
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusedBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.blueGrey)),
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          borderSide: BorderSide(
                                              width: 2.0,
                                              color: Colors.black26)),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GestureDetector(
                                  onTap: controller.onOpenChatButtonPressed,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    elevation: 10,
                                    color: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text(
                                            'Open Chat',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
