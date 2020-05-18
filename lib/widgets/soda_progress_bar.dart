import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SodaProgressBar extends StatelessWidget {
  SodaProgressBar({ Key key, this.values, this.value }): super(key: key);
  final List<int> values;
  final int value;


  @override
  Widget build(BuildContext context) {
    int _progressSizeIndex = values.lastIndexWhere((element) => element <= value);
    int _currentStepValue = values[_progressSizeIndex];

    return Column(
      children: <Widget>[
        Container(
          height: 10,
          width: double.infinity,
          child: ClipRRect(
            child: CustomPaint(
              painter: SodaProgressBarPainter(value: value, values: values),
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: values.map((item) {
            if (item <= _currentStepValue) {
              return Text(item.toString(), style: TextStyle(fontSize: 12, color: Color.fromRGBO(36, 42, 109, 1)));
            }

            return Text(item.toString(), style: TextStyle(fontSize: 12, color: Color.fromRGBO(141, 153, 174, 1)));
          }).toList(),
        ),
      ],
    );
  }
}

class SodaProgressBarPainter extends CustomPainter {
  SodaProgressBarPainter({ this.values, this.value });
  final List<int> values;
  final int value;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  Gradient _gradientEmpty = LinearGradient(
      colors: [
        Color.fromRGBO(241, 37, 72, 1),
        Color.fromRGBO(255, 97, 124, 1),
        Color.fromRGBO(255, 209, 35, 1),
        Color.fromRGBO(36, 240, 182, 1),
        Color.fromRGBO(20, 210, 184, 1),
      ]
  );

  Gradient _gradientSelected = LinearGradient(
      colors: [
        Color.fromRGBO(90, 123, 239, 1),
        Color.fromRGBO(64, 72, 239, 1),
      ]
  );

  double calculateProgressBarPercent() {
    int progressSizeIndex = values.lastIndexWhere((element) => element <= value);
    int stepsLen = values.length - 1;
    double fixedPercent = 100 / stepsLen * progressSizeIndex;


    bool isLast = progressSizeIndex + 1 == values.length;
    if (isLast) {
      return fixedPercent;
    }

    int currentValue = values[progressSizeIndex];
    if (currentValue == value) {
      return fixedPercent;
    }

    int nextValue = values[progressSizeIndex + 1];

    double precentInStep = 100 / stepsLen;
    int meInStep = nextValue - currentValue;
    double percent = precentInStep / meInStep;

    int additional = value - currentValue;
    double additionalPercents = additional * percent;

    return fixedPercent + additionalPercents;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double _offsetHeight = size.height / 2;
    double _startLineWidth = size.width / (values.length - 1);

    Rect rect = Rect.fromPoints(Offset(_startLineWidth, _offsetHeight), Offset(size.width, _offsetHeight));

    Paint paint = Paint()
      ..color = Color.fromRGBO(226, 231, 238, 1)
      ..strokeWidth = size.height;

    Paint paint2 = Paint()
      ..shader = _gradientEmpty.createShader(rect)
      ..strokeWidth = size.height;

    Paint paint3 = Paint()
      ..shader = _gradientSelected.createShader(rect)
      ..strokeWidth = size.height;


    canvas.drawLine(Offset(0, _offsetHeight), Offset(_startLineWidth, _offsetHeight), paint);
    canvas.drawLine(Offset(_startLineWidth, _offsetHeight), Offset(size.width, _offsetHeight), paint2);


    double _progressBarPercent = calculateProgressBarPercent();
    canvas.drawLine(Offset(0, _offsetHeight), Offset(size.width * (_progressBarPercent / 100), _offsetHeight), paint3);
  }
}

//#f12548 0%, #ff617c 20%, #ffd123 50%, #24f0b6 82%, #14d2b8 100%)