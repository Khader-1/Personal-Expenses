import 'package:flutter/material.dart';
import 'package:personal_expensses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction _transaction;
  final Function _delete;

  TransactionWidget(this._transaction, this._delete);

  @override
  Widget build(BuildContext context) {
    Card(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.purple),
            ),
            child: Text(
              '\$${_transaction.cost.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_transaction.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              Text(
                DateFormat('EEE, M/d/y').format(_transaction.date),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Card(
      elevation: 0.3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${_transaction.cost.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(_transaction.title),
        subtitle: Text(DateFormat('EEE, M/d/y').format(_transaction.date)),
        trailing: IconButton(
          onPressed: () {
            _delete(_transaction);
          },
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
