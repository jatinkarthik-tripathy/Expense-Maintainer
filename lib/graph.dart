import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        color: Colors.white,
        child: Text('Graph'),
        elevation: 5,
      ),
    );
  }
}
