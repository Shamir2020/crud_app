import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

const Green = Color.fromRGBO(5, 250, 238, 1);
const red = Color.fromRGBO(250, 5, 87, 1);
const white =  Color.fromRGBO(255,255,255, 1);

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: red,
      textColor: white,
      fontSize: 16.0
  );
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Green,
      textColor: white,
      fontSize: 16.0
  );
}