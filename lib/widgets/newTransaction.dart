import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _add;

  NewTransaction(this._add);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _costController = TextEditingController();

  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 40, right: 40),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
              hintText: 'Specify the title here',
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: _costController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cost',
              hintText: 'Specify the Cost here',
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _date == null
                    ? 'No date choosen'
                    : DateFormat('EEE, M/d/y').format(_date),
                style: TextStyle(fontSize: 16),
              ),
              FlatButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    ).then((value) =>
                        setState(() => _date = value == null ? _date : value));
                  },
                  child: Text(
                    'Pick a date',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            child: FlatButton(
              onPressed: () {
                widget._add(_titleController.text,
                    double.parse(_costController.text), _date);
                Navigator.of(context).pop();
              },
              child: Text(
                'add transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
