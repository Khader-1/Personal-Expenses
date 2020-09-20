import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final _data;
  final _sum;

  double get percentage {
    if (_sum > 0) return _data['value'] / _sum;
    return 0;
  }

  Bar(this._data, this._sum);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Flexible(
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: constraints.maxHeight * 0.02,
          ),
          child: Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.10,
                child: FittedBox(
                  child: Text('\$${_data['value']}'),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.76,
                width: constraints.maxWidth,
                child: Container(
                  margin: EdgeInsets.only(
                      top: constraints.maxHeight * 0.76 * (1 - percentage)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.purple.shade300]),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * 0.10,
                child: FittedBox(child: Text(_data['day'])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
