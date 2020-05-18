import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(79, 93, 183, 1),
      child: TabBar(
        controller: _tabController,
        onTap: (int index) {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  color: Color.fromRGBO(79, 93, 183, 1),
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        controller: _tabController,
                        tabs: <Widget>[
                          Tab(text: 'Items'),
                          Tab(text: 'Orders'),
                          Tab(text: 'Documents'),
                        ],
                        indicator: BoxDecoration(color: Color.fromRGBO(95, 107, 244, 1)),
                      ),
                      Flexible(
                        child: Container(
                          color: Color.fromRGBO(95, 107, 244, 1),
                          child: TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Your cart is empty. Please click product to start shopping.", style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                                    ),
                                    SvgPicture.asset('assets/svg/lid.svg'),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      padding: EdgeInsets.all(0.0),
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        child: Text('SHOW PRODUCTS', style: TextStyle(color: Colors.white),),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            gradient: LinearGradient(
                                                colors: <Color>[
                                                  Color.fromRGBO(233, 63, 148, 1),
                                                  Color.fromRGBO(245, 78, 94, 1),
                                                ]
                                            )
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(),
                              Container(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
        indicator:
        BoxDecoration(color: Color.fromRGBO(95, 107, 244, 1)),
        tabs: <Widget>[
          Tab(text: 'Items'),
          Tab(text: 'Orders'),
          Tab(text: 'Documents')
        ],
      ),
    );
  }
}