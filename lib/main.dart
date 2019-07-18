import 'package:flutter/material.dart';

import './transaction.dart';
import './entries.dart';
import './graph.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Clothes',
      amt: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Food',
      amt: 100,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text('Personal Expenses'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Graph(),
            Entries(transactions),
          ],
        ),
      ),
    );
  }
}
