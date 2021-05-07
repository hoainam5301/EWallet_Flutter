import 'package:flutter/material.dart';

Widget CustomDropDown(
  List<String> items,
  String value,
  void  onChange(val)
){
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: 4.0,
      horizontal: 4.0,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0)
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String val){
        onChange(val);
      },
      items: items.map<DropdownMenuItem<String>>((String val ){
          return DropdownMenuItem(
              child: Text(val),
              value: val,
          );
      }).toList(),
    ),
  );
}