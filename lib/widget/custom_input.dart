import 'package:ewallet/widget/contans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final Function (String) onChange;
  final Function (String) onSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final bool isPasswordField;

  CustomInput({this.hintText,this.onChange,this.onSubmitted,this.focusNode,this.textInputAction,this.isPasswordField});

  @override
  Widget build(BuildContext context) {
    bool _isPasswordField = isPasswordField ?? false;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
      ),
      child: TextField(
        obscureText: _isPasswordField,
        focusNode: focusNode,
        onChanged: onChange,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText:hintText ?? "Hint text....",
          contentPadding: EdgeInsets.symmetric(
            vertical:24.0,
            horizontal: 24.0,
          )
        ),
        style: Constants.regularDarkText,
      ),
    );
  }
}
