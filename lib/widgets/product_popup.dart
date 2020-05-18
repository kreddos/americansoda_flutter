import 'package:americansoda/widgets/count_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      child: IconButton(
                        icon: Icon(Icons.close,
                            color: Color.fromRGBO(70, 84, 239, 1)),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("CHUPA CHUPS STRAWBERRY & CREAM",
                        style: TextStyle(
                            color: Color.fromRGBO(36, 42, 109, 1),
                            fontSize: 20),
                        textAlign: TextAlign.center),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: constraints.minWidth,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        padding: EdgeInsets.all(constraints.minWidth * 0.15),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(70, 84, 239, 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(constraints.minWidth))),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Image.network(
                            "https://gtp.americansoda.demo.crmplease.me/uploads/images/products/product_image/512x512_crop/RDGoEwXX8x4qgcsC.png",
                            fit: BoxFit.cover)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CountInput(
                    value: 10,
                  ),
                  SizedBox(width: 10),
                  RaisedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'add'.toUpperCase(),
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: '1 ME = 1 x ',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 24)),
                            TextSpan(
                                text: '24 pack',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 24))
                          ],
                        ),
                      ),
                      Text('0 kg',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24))
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Volume:',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text('0.35',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Brutto weight:',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text('0.35',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Brutto volume:',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text('0.35',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Deposit price:',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text('0.35',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Deposit VAT:',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        Text('0.35',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200),
            ],
          ),
        );
      },
    );
  }
}
