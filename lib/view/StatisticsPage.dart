import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("时钟页面"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Text("统计数据")
        ));
  }
}
