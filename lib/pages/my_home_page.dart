import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
            (_) => context.bloc<ProfileBloc>().add(LoadProfileEvent()));
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  color: Theme.of(context).primaryColor,
                  child: CustomAppBar(),
                ),
                BlocBuilder<BannersBloc, BannersState>(
                  builder: (context, state) {
                    if (state is LoadingSuccessBannersState) {
                      if (state.data.length == 0) {
                        return Container();
                      }
                      return AppBanners(data: state.data);
                    }

                    return Container(
                      child: Text('loading...'),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: SodaProgressBar(
                    values: [0, 7, 40, 108],
                    value: 6,
                  ),
                ),
                Flexible(
                  child: Container(child: Products()),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: BottomTabs(),
            ),
          ],
        ),
      ),
    );
  }
}