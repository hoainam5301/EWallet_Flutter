import 'package:ewallet/widget/chart_column.dart';
import 'package:ewallet/widget/chart_widget.dart';
import 'package:ewallet/widget/contans.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../widget/custom_actionbar.dart';

class ChartTab extends StatelessWidget {
  final List<ChartColumn> datathu = [
    ChartColumn(
        thuchi: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        year: "12"),
    ChartColumn(
        thuchi: 30000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        year: "10"),
    ChartColumn(
        thuchi: 150000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        year: "2"),
    ChartColumn(
        thuchi: 600000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue),
        year: "9"),
  ];
  final List<ChartColumn> datachi = [
    ChartColumn(
        thuchi: 25000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
        year: "12"),
    ChartColumn(
        thuchi: 10000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
        year: "10"),
    ChartColumn(
        thuchi: 75000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
        year: "2"),
    ChartColumn(
        thuchi: 300000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red),
        year: "9"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Column(
          children: [
            Stack(
              children: [
                CustomActionBar(),
                ChartWidget(datachi: datachi, datathu: datathu)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [BoxShadow(color: Colors.indigo
                            .withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),)
                        ]
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Chi",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [BoxShadow(color: Colors.indigo
                            .withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3),)
                        ]
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("Thu",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        )),
      ],
    );
  }
}
