import 'package:ewallet/tabs/chart_tab.dart';
import 'package:ewallet/tabs/home_tab.dart';
import 'package:ewallet/tabs/person_tab.dart';
import 'package:ewallet/tabs/wallet_tab.dart';
import 'package:ewallet/widget/bottom_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _tabController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: _tabController,
            onPageChanged: (num) {
              setState(() {
                _selectedTab = num;
              });
            },
            children: [
              HomeTab(),
              ChartTab(),
              WalletTab(),
              PersonTab(),
            ],
          )),
          BottomTabs(
            selectTab: _selectedTab,
            tabPressed: (num){
              _tabController.animateToPage(num, duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);

            },
          ),
        ],
      ),
    );
  }
}
