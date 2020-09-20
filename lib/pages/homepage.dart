import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expensses/models/transaction.dart';
import 'package:personal_expensses/widgets/chart.dart';
import 'package:personal_expensses/widgets/newTransaction.dart';
import 'package:personal_expensses/widgets/transactions_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [];

  void _addTransaction(String title, double amount, DateTime date) {
    setState(() {
      _transactions.add(Transaction(title: title, cost: amount, date: date));
    });
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      _transactions.remove(transaction);
    });
  }

  void modalShow(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = !Platform.isIOS
        ? AppBar(
            title: Text('Personal Expenses'),
            actions: [
              IconButton(
                icon: Icon(CupertinoIcons.add),
                onPressed: () {
                  modalShow(context);
                },
              )
            ],
          )
        : CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: CupertinoButton(
              child: Icon(Icons.add),
              onPressed: () {
                modalShow(context);
              },
            ),
          );
    final body = SafeArea(
      child: SingleChildScrollView(
        child: _transactions.isNotEmpty
            ? Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom),
                child: LayoutBuilder(
                  builder: (ctx, constrains) => Column(
                    children: [
                      Container(
                          height: constrains.maxHeight * .4,
                          child: Chart(_transactions)),
                      Container(
                          height: constrains.maxHeight * .6,
                          child:
                              Transactions(_transactions, _deleteTransaction))
                    ],
                  ),
                ),
              )
            : Container(
                padding: EdgeInsets.only(top: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                    Center(
                      child: Text(
                        'No Transactions added yet!!',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: body,
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButton: !Platform.isIOS
                ? FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      modalShow(context);
                    },
                  )
                : Container(),
            body: body);
  }
}
