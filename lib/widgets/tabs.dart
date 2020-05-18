import 'package:americansoda/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double width = constrains.minWidth / 3;

        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: -15,
              width: width + 30,
              height: 100,
                child: AppTab()
            ),
            Positioned(
              width: width + 30,
              height: 100,
              left: width - 15,
              child: AppTab()
            ),
            Positioned(
              width: width + 30,
              height: 100,
              left: (width * 2) - 15,
              child: AppTab()
            ),
          ],
        );
      },
    );
  }
}