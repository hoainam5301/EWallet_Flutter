import 'package:ewallet/tabs/person_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomTabs extends StatefulWidget {

  final int selectTab;
  final Function (int) tabPressed;
  BottomTabs({this.selectTab,this.tabPressed});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectTab= widget.selectTab ?? 0 ;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight:Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
          ),
        boxShadow:[
          BoxShadow(
            color:Colors.black.withOpacity(0.08),
            spreadRadius:1.0,
            blurRadius:30.0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            imagePath: "assets/images/homewallet.png",
            selected: _selectTab == 0 ? true : false ,
            onPressed: (){
              widget.tabPressed(0);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/chart.png",
            selected: _selectTab == 1 ? true : false ,
            onPressed: (){
              widget.tabPressed(1);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/plus.png",
            selected: _selectTab == 6 ? true : false ,
            onPressed: (){
             // widget.tabPressed(6);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/wallet2.png",
            selected: _selectTab == 2 ? true : false ,
            onPressed: (){
              widget.tabPressed(2);
            },
          ),
          BottomTabBtn(
            imagePath: "assets/images/person.png",
            selected: _selectTab == 3 ? true : false ,
            onPressed: (){
              widget.tabPressed(3);
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;

  BottomTabBtn({this.imagePath,this.onPressed,this.selected});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: _selected ? Theme.of(context).accentColor : Colors.transparent,
                ))),
        child: Image(
          image: AssetImage(imagePath ?? ""),
          width: 40.0,
          height: 40.0,
          color: _selected ? Theme.of(context).accentColor : Colors.black,
        ),
      ),
    );
  }

}
