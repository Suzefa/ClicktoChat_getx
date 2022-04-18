import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CommonCode{

  CommonCode._internalConstructor();

  static final CommonCode _commonCode=CommonCode._internalConstructor();

  factory CommonCode(){
    return _commonCode;
  }

  Future<bool> onBackButtonPressed() async {
    Get.defaultDialog(
      content: const Text(
        'Do you want to Exit..?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () => Get.back(),
          child: Card(
            color: Colors.red,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => SystemNavigator.pop(),
          child: Card(
            color: Colors.green,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
    return false;
  }


  InputDecoration textFieldDecoration =  InputDecoration(
    constraints: const BoxConstraints(minHeight: 50),
    // isDense: true,
    fillColor: Colors.green.shade100,
    filled: true,
    counterText: '',
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.blueGrey)),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black26)),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );


}