 import 'package:ewallet/widget/contans.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ewallet/widget/chart_column.dart';

class ChartWidget extends StatelessWidget {
  final List<ChartColumn>  datathu;
  final List<ChartColumn>  datachi;

  ChartWidget({
    @required this.datathu,
    @required this.datachi
  });
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartColumn, String >> series
    = [
      charts.Series(
        id: "Thu cho trong thang",
        data: datathu,
        domainFn: (ChartColumn series, _) =>
        series.year,
        measureFn: (ChartColumn series, _)=>
        series.thuchi,
        colorFn: (ChartColumn series, _)=>
        series.barColor,
      ),
      charts.Series(
        id: "chi cho trong thang",
        data: datachi,
        domainFn: (ChartColumn series, _) =>
        series.year,
        measureFn: (ChartColumn series, _)=>
        series.thuchi,
        colorFn: (ChartColumn series, _)=>
        series.barColor,
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.only(
        top: 50.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Card(
        child: Column(
          children: [
            Text("Test chart",
            style: Constants.regularDarkText,),
            Expanded(
              child: charts.BarChart(series,animate: true,),
            )
          ],
        ),
      ),
    );
  }
}
