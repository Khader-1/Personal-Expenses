import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List _transactions;

  double _bestWidth(context) {
    double relative = MediaQuery.of(context).size.width - 20;
    relative /= 7;
    print(relative);
    return 100 > relative ? relative : 100;
  }

  Chart(this._transactions);

  List get _recentWeek {
    return _transactions.where((element) {
      return (element.date.isAfter(DateTime.now().subtract(Duration(days: 7))));
    }).toList();
  }

  List<Map<String, Object>> get _weekData {
    final today = DateTime.now();
    return List.generate(7, (index) {
      final theOtherday = today.subtract(Duration(days: index));
      double sum = 0;
      _recentWeek.forEach((element) {
        if (element.date.day == theOtherday.day) {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List<Widget>.generate(
            weekData.length,
            (index) {
              return Container(
                width: _bestWidth(context),
                child: Bar(weekData.elementAt(6 - index), sum),
              );
            },
          ),
        ),
      ),
    );
  }
}
