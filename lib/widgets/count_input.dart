import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountInput extends StatelessWidget {
  CountInput({
    Key key,
    @required this.value,
    this.step,
    this.minValue,
    this.maxValue,
    this.onChange,
  }) : super(key: key);
  final double value;
  final double step;
  final double minValue;
  final double maxValue;
  final void Function(double) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.remove, color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 28),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).primaryColor,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
