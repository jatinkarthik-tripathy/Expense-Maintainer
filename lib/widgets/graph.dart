import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        child: Text('Graph'),
        elevation: 5,
      ),
    );
  }
}
