import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Graph extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Graph(this.recentTransactions);

  List<Map<String, Object>> get groupedTx {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amt;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTx);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      width: double.infinity,
      child: Card(
        color: Colors.amber,
        elevation: 5,
        margin: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            ...groupedTx.map((data){
              return Text('${data['day']}: ${data['amt']}');
            }).toList(),
          ],
        ),
      ),
    );
  }
}
