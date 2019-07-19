import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtController = TextEditingController();

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.parse(amtController.text);
    if (enteredTitle.isEmpty || enteredAmt <=0){
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmt
    );
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitTx(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTx() ,
            ),
            RaisedButton(
              child: Text('Add Entry'),
              onPressed: submitTx,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
