import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 32.0,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/wallet2.png"
                ),
                Text("  Money  "),
                GestureDetector(
                  onTap: (){
                    print("has press down arrow");
                  },
                  child: Container(
                      child: Image.asset(
                        "assets/images/downarrow.png",
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    print("has pressed notification");
                  },
                    child: Container(
                      child: Image.asset(
                        "assets/images/bell.png"
                      ),
                    )
                ),
                GestureDetector(
                  onTap:(){
                    print("has pressed setting");
                  } ,
                  child: Container(
                    child: Image.asset(
                      "assets/images/setting.png"
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
