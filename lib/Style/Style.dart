import 'dart:ui';

import 'package:flutter/material.dart';

const Color1 = Color.fromRGBO(0, 255, 242, 1);
const Color2 = Color.fromRGBO(0, 255, 208, 1);
const Color3 = Color.fromRGBO(255, 0, 174, 1);
const Color4 = Color.fromRGBO(235, 245, 105,1);


InputDecoration FormFieldDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Color2,width: 1)
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white,width: 0)
    ),
    labelText: label
  );
}

DecoratedBox DropDownStyle(child){
  return DecoratedBox(decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white,width: 1),
    borderRadius: BorderRadius.circular(4),
  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30.0,right: 30.0),
      child: child,
    ),
  );
}

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle(){
 return SliverGridDelegateWithFixedCrossAxisCount(
   crossAxisCount: 2,
   mainAxisSpacing: 2,
   mainAxisExtent: 250,
 );
}