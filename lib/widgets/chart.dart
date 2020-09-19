import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List _transactions;

  Chart(this._transactions);

  List<Map<String, Object>> get _weekData {
    final today = DateTime.now();
    return List.generate(7, (index) {
      final theOtherday = today.subtract(Duration(days: index));
      double sum = 0;
      _transactions.forEach((element) {
        if (element.date.isAfter(theOtherday.subtract(Duration(days: 7))) &&
            element.date.day == theOtherday.day) {
          sum += element.cost;
        }
      });
      return {
        'day': DateFormat('E').format(theOtherday),
        'value': sum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final weekData = _weekData;
    double sum = 0;
    weekData.forEach((element) {
      sum += element['value'];
    });
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15),
      child: Card(
        elevation: 6,
        child: Row(
          children: List<Widget>.generate(
            weekData.length,
            (index) {
              return Bar(weekData.elementAt(index), sum);
            },
          ),
        ),
      ),
    );
  }
}
