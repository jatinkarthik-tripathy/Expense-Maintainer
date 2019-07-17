import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Personal Expenses'),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.white,
                child: Text('Graph'),
                elevation: 5,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Card(
                  color: Colors.amberAccent,
                  child: Row(
                    children: <Widget>[
                      Text('Money'),
                      Container(
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                        child: Column(
                          children: <Widget>[Text('Item'), Text('Date')],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
