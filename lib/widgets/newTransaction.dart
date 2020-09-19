import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function _add;
  final _titleController = TextEditingController();
  final _costController = TextEditingController();
  NewTransaction(this._add);

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
          Padding(padding: EdgeInsets.all(10)),
          TextButton(
            onPressed: () {
              _add(_titleController.text, double.parse(_costController.text));
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('add transaction'),
            ),
          )
        ],
      ),
    );
  }
}
