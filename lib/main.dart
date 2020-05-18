import 'package:americansoda/bloc/bloc.dart';
import 'package:americansoda/bloc/providers/providers.dart';
import 'package:americansoda/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NomenclatureBloc>(
          create: (BuildContext context) => NomenclatureBloc(),
        ),
        BlocProvider<BannersBloc>(
          create: (BuildContext context) => BannersBloc(),
        ),
        BlocProvider<CustomerBloc>(
          create: (BuildContext context) =>
              CustomerBloc(bannersBloc: context.bloc<BannersBloc>(), nomenclatureBloc: context.bloc<NomenclatureBloc>()),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) =>
              ProfileBloc(customerBloc: context.bloc<CustomerBloc>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(85, 106, 244, 1),
          accentColor: Color.fromRGBO(36, 42, 109, 1),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(36, 42, 109, 1),
                fontWeight: FontWeight.bold),
            headline2:
                TextStyle(fontSize: 20, color: Color.fromRGBO(36, 42, 109, 1)),
            subtitle1: TextStyle(
                fontSize: 12, color: Color.fromRGBO(141, 153, 174, 1)),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}