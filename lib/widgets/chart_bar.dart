import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final _data;
  final _sum;

  Bar(this._data, this._sum);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text((_data.value / _sum).toString()),
          Text(_data.day),
        ],
      ),
    );
  }
}
