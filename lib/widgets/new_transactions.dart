import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amtController = TextEditingController();
  DateTime selectedDate;

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmt = double.parse(amtController.text);
    if (enteredTitle.isEmpty || enteredAmt <= 0 || selectedDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmt, selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Card(
          color: Colors.white30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                onSubmitted: (_) => submitTx(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      selectedDate == null
                          ? 'No Date Chosen'
                          : 'Picked Date: ${DateFormat.yMd().format(selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
              RaisedButton(
                child: Text('Add Entry'),
                onPressed: submitTx,
                color: Colors.amber,
              )
            ],
          ),
        ),
      ),
    );
  }
}
