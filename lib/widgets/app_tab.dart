import 'package:flutter/material.dart';

class AppTab extends StatelessWidget {
  AppTab({ Key key, this.child, this.color}): super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 15,
          height: 15,
          child: CustomPaint(
            painter: _LeftTabPainter(color: Color.fromRGBO(95, 107, 244, 1)),
          ),
        ),
        Flexible(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  color: Color.fromRGBO(95, 107, 244, 1)
              )
          ),
        ),
        Container(
          width: 15,
          height: 15,
          child: CustomPaint(
            painter: _RightTabPainter(color: Color.fromRGBO(95, 107, 244, 1)),
          ),
        ),
      ],
    );
  }
}


class _LeftTabPainter extends CustomPainter {
  _LeftTabPainter({ @required this.color });
  final Color color;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path = Path()
      ..moveTo(0, size.height / 2)
      ..relativeLineTo(size.width + 1, 0)
      ..relativeLineTo(0, -size.height)
      ..relativeArcToPoint(Offset(-size.width, size.height), radius: Radius.elliptical(size.width, size.height));

    canvas.drawPath(path, paint);
  }
}

class _RightTabPainter extends CustomPainter {
  _RightTabPainter({ @required this.color });
  final Color color;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path = Path()
      ..moveTo(0, 0)
      ..relativeLineTo(0, size.height / 2)
      ..relativeLineTo(size.width, 0)
      ..relativeArcToPoint(Offset(-size.width, -size.height), radius: Radius.elliptical(size.width, size.height));

    canvas.drawPath(path, paint);
  }
}