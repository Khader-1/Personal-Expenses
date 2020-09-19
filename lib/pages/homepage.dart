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

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions
          .add(Transaction(title: title, cost: amount, date: DateTime.now()));
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
    return Scaffold(
        appBar: AppBar(
          title: Text('PE'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                modalShow(context);
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            modalShow(context);
          },
        ),
        body: SingleChildScrollView(
          child: _transactions.isNotEmpty
              ? Column(
                  children: [Chart(_transactions), Transactions(_transactions)],
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
        ));
  }
}
