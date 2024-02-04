import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restapi/AddScreen.dart';

const ColorRed = Color.fromRGBO(231, 28, 36, 1);
const ColorGreen = Color.fromRGBO(33, 191, 115, 1);
const ColorWhite = Color.fromRGBO(255, 255, 255, 1);
const ColorDarkBlue = Color.fromRGBO(44, 62, 80, 1);

InputDecoration MyDecoration(label) {
  return InputDecoration(
    label: Text(
      "$label",
      style: TextStyle(color: Colors.grey.shade500),
    ),
  );
}
FloatingActionButton MyFabBatton (context){
  return FloatingActionButton.extended(

    backgroundColor: ColorDarkBlue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    icon: Icon(Icons.add),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),),);
    },
    label: const Text("Add",style: TextStyle(fontSize: 16),),
  );
}