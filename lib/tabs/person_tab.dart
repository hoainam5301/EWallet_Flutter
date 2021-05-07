import 'package:ewallet/widget/contans.dart';
import 'package:ewallet/widget/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PersonTab extends StatelessWidget {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),

                    child: CircleAvatar(
                      radius: 70.0,
                      //maxRadius: 70.0,
                      child: ClipRRect(
                          borderRadius: new BorderRadius.circular(100.0),
                          child: Image.asset(

                            "assets/images/person64.png",
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill
                          )
                      ) ,
                    )
                  ),
                ),
              ]
            ),
            TabButton(
              titleText: "My wallet",
              imagePahtIcon: "assets/images/wallet2.png",
              imageArrow: "assets/images/right_arrow.png",
              onPressed: (){

              },
            ),
            TabButton(
              titleText: "Convert",
              imagePahtIcon: "assets/images/moneycirculation.png",
              imageArrow: "assets/images/right_arrow.png",
            ),
            TabButton(
              titleText: "Notification",
              imagePahtIcon: "assets/images/bell.png",
              imageArrow: "assets/images/right_arrow.png",
            ),
            TabButton(
              titleText: "Settings",
              imagePahtIcon: "assets/images/setting.png",
              imageArrow: "assets/images/right_arrow.png",
            ),
            TabButton(
              titleText: "Log Out",
              imagePahtIcon: "assets/images/export.png",
              imageArrow: "assets/images/right_arrow.png",
              onPressed: (){
                _signOut();
              },
            ),

          ],
        ),
    );

  }
}
