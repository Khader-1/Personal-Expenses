import 'package:flutter/material.dart';
import 'package:personal_expensses/widgets/transaction_widget.dart';

class Transactions extends StatelessWidget {
  final _transactions;
  final Function _deleteTransaction;

  Transactions(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, index) {
          return TransactionWidget(
            _transactions[_transactions.length - (index + 1)],
            this._deleteTransaction,
          );
        });
  }
}
