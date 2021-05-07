import 'package:ewallet/widget/contans.dart';
import 'package:ewallet/widget/custom_actionbar.dart';
import 'package:flutter/material.dart';

class WalletTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          CustomActionBar(),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: ListView(
                padding: EdgeInsets.only(
                  top: 108.0,
                  bottom: 12.0,
                ),
                children: [
                  Container(
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      width: MediaQuery.of(context).size.width,
                      height: 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 128.0,
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 128.0,
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 128.0,
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 128.0,
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 128.0,
                      margin:EdgeInsets.symmetric(
                        vertical: 12.0,
                      ) ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          color: Colors.blue),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                              ),
                              Text("Wallet number ",
                                  style: Constants.regularDarkText)
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                "Should be left",
                                style: Constants.regularDarkText,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("has pressed plus wallet");
            },
            child: Padding(
              padding: const EdgeInsets.only(
                top: 600.0,
                left: 340.0,
              ),
              child: Image.asset(
                "assets/images/plus.png",
                width: 32.0,
                height: 32.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
