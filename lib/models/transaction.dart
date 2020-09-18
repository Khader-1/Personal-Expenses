import 'package:flutter/foundation.dart';

class Transaction {
  String _title;
  double _cost;
  DateTime _date;

  Transaction({@required title, @required cost, @required date}) {
    _title = title;
    _cost = cost;
    _date = date;
  }

  String get title {
    return _title;
  }

  double get cost {
    return _cost;
  }

  DateTime get date {
    return _date;
  }
}
