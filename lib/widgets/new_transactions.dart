import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        elevation: 50,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtController,
            ),
            RaisedButton(
              child: Text('Add Entry'),
              onPressed: () {
                addTx(
                  titleController.text,
                  double.parse(amtController.text),
                );
              },
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
