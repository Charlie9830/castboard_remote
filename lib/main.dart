import 'package:castboard_remote/containers/HomeScaffoldContainer.dart';
import 'package:castboard_remote/redux/AppStore.dart';
import 'package:castboard_remote/redux/state/AppState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: appStore,
      child: MaterialApp(
        title: 'Castboard Remote',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: HomeScaffoldContainer(),
      ),
    );
  }
}