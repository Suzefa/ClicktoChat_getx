import 'package:flutter/material.dart';

class CommonCode{

  CommonCode._internalConstructor();

  static final CommonCode _commonCode=CommonCode._internalConstructor();

  factory CommonCode(){
    return _commonCode;
  }

  InputDecoration textFieldDecoration =  InputDecoration(
    constraints: const BoxConstraints(minHeight: 50),
    // isDense: true,
    fillColor: Colors.green.shade100,
    filled: true,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.blueGrey)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: Colors.black26)),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );


}