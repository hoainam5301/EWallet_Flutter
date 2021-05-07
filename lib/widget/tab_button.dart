import 'package:ewallet/widget/contans.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String titleText;
  final String imagePahtIcon;
  final Function onPressed;
  final String imageArrow;

  TabButton({this.titleText, this.imagePahtIcon, this.onPressed, this.imageArrow});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        width: 32.0,
                        alignment: Alignment.center,
                        image: AssetImage(imagePahtIcon ?? ""),
                      ),
                    ),
                    Text(
                      titleText,
                      textAlign: TextAlign.left,
                      style: Constants.boldHeading,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(

                ),
                child: Image(
                  alignment: Alignment.centerRight,
                  image: AssetImage(imageArrow ?? ""),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
