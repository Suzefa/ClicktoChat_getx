import 'package:click_to_chat/utils/application_constants.dart';
import 'package:click_to_chat/utils/common_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? screenName;
  final String className;
  final Widget bodyWidget;
  final Function? onScreenTap, onBackButtonPress;

  const CustomScaffold({ required this.bodyWidget,
    required this.scaffoldKey,
    required this.className,
    this.onBackButtonPress,
    this.onScreenTap,
    this.screenName,
    Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: className==kSplashScreenRoute.split('/').last ? null :  PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: _customAppBar(context),
        ),
        key: scaffoldKey,
        drawer:className==kImageViewerScreenRoute.split('/').last ? null : _customDrawer(),
        body: WillPopScope(
          onWillPop: () async {
            if (onBackButtonPress != null) {
              onBackButtonPress!();
            }
            return Future.value(false);
          },
          child: GestureDetector(
            onTap: () {
              if (onScreenTap != null) {
                onScreenTap!();
              }
            },
            child: Container(
              width: Get.width,
              color: Colors.white60,
              child: bodyWidget,),
          ),
        ),
      ),
    );
  }

  Widget _customDrawer() {
    double borderRadius = 35.0;
    return Container(
      height: Get.height,
      width: Get.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(kLogoAddress),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ),
          CommonCode().customTextWidget(text: 'Click To Chat', textSize: 25.0),
          _customDivider(),
          _drawerButton(
            title: 'Home Page',
            iconData: Icons.home,
            function: () =>
                CommonCode().drawerHomePageButton(className),
          ),
          _drawerButton(
            title: 'Status Page',
            iconData: Icons.perm_media_rounded,
            function: () =>
                CommonCode().drawerStatusPageButton(className),
          ),
          const Spacer(),
          _drawerButton(
            title: 'Exit',
            iconData: Icons.exit_to_app,
            function: CommonCode().onBackButtonPressed,
          ),
          _customDivider(),
          CommonCode().customTextWidget(text: 'Version: 1.0.0'),
          CommonCode().customTextWidget(text: 'h.qureshi333@hotmail.com'),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Divider(
        color: Colors.black,
        thickness: 2.0,
      ),
    );
  }

  Widget _drawerButton(
      {String? title, Function? function, IconData? iconData}) {
    RxBool isElevated = true.obs;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
      child: Obx(
            () =>
            GestureDetector(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title ?? 'Button Name',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Icon(iconData ?? Icons.height),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _customAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: Get.width,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black,width: 2.0),),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.menu, size: 35.0,),
            ),
          ),
          const Spacer(),
          CommonCode().customTextWidget(text: screenName ?? 'Well Come',textSize: 20),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(35.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,width: 2.0),
                  borderRadius: BorderRadius.circular(35.0),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(kLogoAddress,),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

}
