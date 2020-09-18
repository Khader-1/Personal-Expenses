import 'package:flutter/material.dart';
import 'package:personal_expensses/models/transaction.dart';
import 'package:personal_expensses/widgets/transactions_list.dart';

import 'widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PE'),
        ),
        body: Column(
          children: [
            Chart(),
            Transactions([
              Transaction(title: 'test 1', cost: 45.5, date: DateTime.now()),
              Transaction(title: 'test 2', cost: 65.2, date: DateTime.now()),
              Transaction(title: 'test 1', cost: 32.0, date: DateTime.now()),
            ]),
          ],
        ),
      ),
    );
  }
}
