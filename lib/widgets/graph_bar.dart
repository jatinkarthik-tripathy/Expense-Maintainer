import 'package:flutter/material.dart';

class GraphBar extends StatelessWidget {
  final String label;
  final double amt;
  final double pct;

  GraphBar(this.label, this.amt, this.pct);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('\$${amt.toStringAsFixed(0)}'),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: pct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(label),
      ],
    );
  }
}
