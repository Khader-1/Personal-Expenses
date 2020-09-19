import 'package:flutter/material.dart';
import 'package:personal_expensses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction _transaction;

  TransactionWidget(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
  }
}
