import 'package:click_to_chat/controllers/home_screen_controller.dart';
import 'package:click_to_chat/screens/custom_screens/custom_scaffold.dart';
import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onScreenTap: controller.removeFocus,
      screenName: 'Home Screen',
      bodyWidget: _body(),
      scaffoldKey: controller.homeScreenKey,
      className: runtimeType.toString(),
      onBackButtonPress: CommonCode().onBackButtonPressed,
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                elevation: 5.0,
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
                        child: CommonCode()
                            .customTextWidget(text: 'Open Chats Faster'),
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.fieldErrorMessage.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                controller.fieldErrorMessage.value,
                                style: TextStyle(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
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
                              controller:
                                  controller.phoneNumberTextEditingController,
                              focusNode: controller.phoneFieldFocusNode,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
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
                                fillColor: Colors.white60,
                                focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.blueGrey)),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                    borderSide: BorderSide(
                                        width: 2.0, color: Colors.black26)),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Visibility(
                            visible: controller.historyList.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30.0),
                              child: _customButton(
                                  title: 'Show history',
                                  iconData: Icons.history,
                                  buttonColor: Colors.grey.shade400
                                // function: controller.onOpenChatButtonPressed,
                              ),
                            ),
                          ),),
                          _customButton(
                            buttonColor: Colors.green.shade400,
                            title: 'Open Chat',
                            iconData: Icons.send,
                            function: controller.onOpenChatButtonPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(50.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        kLogoAddress,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _customSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  Widget _searchCard() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.green.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              _customSizedBox(height: 20.0),
              const Text(
                'Open Chats Without Saving Number',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _customSizedBox(height: 20.0),
              Obx(
                () => Visibility(
                  visible: controller.fieldErrorMessage.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        controller.fieldErrorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
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
                    controller: controller.phoneNumberTextEditingController,
                    focusNode: controller.phoneFieldFocusNode,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: CountryCodePicker(
                        showFlag: true,
                        initialSelection: 'PK',
                        favorite: const ['+92', 'PK'],
                        onChanged: (country) {
                          controller.countryCode.value = '${country.dialCode}';
                        },
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blueGrey)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.black26)),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
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
    );
  }

  Widget _customButton(
      {String? title,
      Function? function,
      IconData? iconData,
      Color? buttonColor,
      Color? textColor}) {
    RxBool isElevated = true.obs;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Obx(
        () => GestureDetector(
          onTap: () {
            isElevated.value = false;
            Future.delayed(const Duration(milliseconds: 200), () {
              isElevated.value = true;
            });
            if (function != null) {
              function();
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: buttonColor ?? Colors.white,
              boxShadow: isElevated.value
                  ? [
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(4, 4),
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(-2, -4),
                          blurRadius: 6,
                          spreadRadius: 1),
                    ]
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? 'Button Name',
                    style: TextStyle(
                        color: textColor ?? Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      iconData ?? Icons.height,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
