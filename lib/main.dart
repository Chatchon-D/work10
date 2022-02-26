import 'dart:math';

import 'package:flutter/material.dart';

import 'covid_model.dart';


void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<CovidModel> covidReportList = [
    CovidModel(date: '1 ก.ค. 2564', numCase: 5533, numDeath: 57),
    CovidModel(date: '2 ก.ค. 2564', numCase: 6087, numDeath: 61),
    CovidModel(date: '3 ก.ค. 2564', numCase: 6230, numDeath: 41),
    CovidModel(date: '4 ก.ค. 2564', numCase: 5916, numDeath: 44),
    CovidModel(date: '5 ก.ค. 2564', numCase: 6166, numDeath: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COVID REPORT')),
      body: ListView.builder(
          itemCount: covidReportList.length,
          itemBuilder: (context, index) =>
              MyCard(covid: covidReportList[index])),
    );
  }
}

class MyCard extends StatelessWidget {
  final CovidModel covid;

  const MyCard({
    Key? key,
    required this.covid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(covid.date),
            Row(
              children: [
                SizedBox(width: 20.0),
                Expanded(
                    child: Text(
                        'จำนวนผู้ติดเชื้อ: ${covid.numCase}')),
                Expanded(
                    child: Text(
                        'จำนวนผู้เสียชีวิต: ${covid.numDeath}'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

