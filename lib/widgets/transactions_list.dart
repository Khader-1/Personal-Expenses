import 'package:flutter/material.dart';
import 'package:personal_expensses/widgets/transaction_widget.dart';

class Transactions extends StatelessWidget {
  final _transactions;

  Transactions(this._transactions);

  @override
  Widget build(BuildContext context) {
    var list = _transactions.map((transaction) {
      return TransactionWidget(transaction);
    }).toList();
    return Column(children: <Widget>[...list]);
  }
}
