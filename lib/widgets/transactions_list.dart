import 'package:flutter/material.dart';
import 'package:personal_expensses/widgets/transaction_widget.dart';

class Transactions extends StatelessWidget {
  final _transactions;

  Transactions(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 700,
        child: ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionWidget(_transactions[index]);
            }),
      ),
    ]);
  }
}
